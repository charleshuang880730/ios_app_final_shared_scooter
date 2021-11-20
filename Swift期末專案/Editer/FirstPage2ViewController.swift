//
//  FirstPage2ViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/22.
//

import UIKit

class FirstPage2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func historyButton(_ sender: Any) {
        performSegue(withIdentifier: "firstToHistory2", sender: nil)
    }
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: "firstToProfile2", sender: nil)
    }
    
    
    
    @IBOutlet weak var firstpage2TableView: UITableView!
    
    var motorBikeData: [motorBike] = []

    func getMotorData() {
        let address = "http://127.0.0.1:5000/getCarList"
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print(data)
                    print("Status code: \(response.statusCode)")
                    if let motorData = try? JSONDecoder().decode([motorBike].self, from: data) {
                        DispatchQueue.main.async{
                            print("success")
                            print("this is ",motorData)
                            self.motorBikeData = motorData
                            self.firstpage2TableView.reloadData()
                        }
                    }else{print("decode failed")}
                    print("this is data ",self.motorBikeData)
                }
            }.resume()
        } else {
            print("Invalid URL.")
        }
    }

    override func viewDidLoad() {
        getMotorData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstpage2TableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        firstpage2TableView.delegate = self
        firstpage2TableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return motorBikeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MotorCell2", for: indexPath) as! FirstPage2TableViewCell
        
        let motor = motorBikeData[indexPath.row]
        cell.carID.text = motor.id
        cell.batteryValue.text = String(motor.battery)
        cell.rateValue.text = String(motor.rate)
        //cell.goToMap.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
            if editingStyle == .delete {
          // Delete the row from the data source
                let url = URL(string: "http://127.0.0.1:5000/deleteCar?id=\(self.motorBikeData[indexPath.row].id)")!
                print(url)
                var request = URLRequest(url: url)
                request.httpMethod = "GET"

                let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                            //the service response is here
                    print(response!)
                })

                task.resume()
                
                motorBikeData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
            tableView.reloadData() // 更新tableView
        }
        
    func tableView(_ tableView: UITableView,titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)-> String?
        {
            return "刪除"
        }
/*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let motorD = motorBikeData[indexPath.row]
        performSegue(withIdentifier: "GoToMap", sender: motorD)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GoToMap":
            let motor = sender as! motorBike
            
            let destination = segue.destination
            let motorInfoVC = destination as! mapPageViewController
            
            motorInfoVC.motorD = motor
        default:
            break
        }
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
