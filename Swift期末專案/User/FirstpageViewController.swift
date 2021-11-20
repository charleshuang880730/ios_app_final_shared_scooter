//
//  FirstpageViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/17.
//

import UIKit


class FirstpageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func historyPageButton(_ sender: Any) {
        performSegue(withIdentifier: "GoToHistory", sender: nil)
    }
    @IBAction func profilePageButton(_ sender: Any) {
        performSegue(withIdentifier: "GoToProfile", sender: nil)
    }
    @IBAction func goToMap(_ sender: Any) {
        //performSegue(withIdentifier: "GoToMap", sender: nil)
    }
    
    @IBOutlet weak var firstpageTableView: UITableView!
    
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
                            self.firstpageTableView.reloadData()
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
        //fetchD.fetchD{ motorArray in self.motorBikeData = motorArray }
        getMotorData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstpageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        firstpageTableView.delegate = self
        firstpageTableView.dataSource = self

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MotorCell", for: indexPath) as! FirstpageTableViewCell
        
        let motor = motorBikeData[indexPath.row]
        cell.carID.text = motor.id
        cell.carDistance.text = String(motor.location)
        cell.batteryValue.text = String(motor.battery)
        cell.carAvailableDistance.text = "300"
        //cell.goToMap.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        return cell
    }

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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
