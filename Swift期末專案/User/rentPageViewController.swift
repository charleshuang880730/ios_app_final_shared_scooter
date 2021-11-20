//
//  rentPageViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/20.
//

import UIKit

class rentPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var motorD: motorBike? = nil
    var rent = 1
    
    @IBOutlet weak var rentPageTableView: UITableView!
    
    @IBAction func rentPage(_ sender: UIButton) {
        
        if rent == 1{
            
            print("in")
            rent = 0
            sender.setTitle("歸還", for: .normal)
            
            let url = URL(string: "http://127.0.0.1:5000/rentCar?id=\(motorD!.id)")!
            print(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.addValue("application/json", forHTTPHeaderField: "Accept")

            let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                        //the service response is here
                print(response!)
            })

            task.resume()
            
        }
        else if rent == 0{
            
            rent = 1
            sender.setTitle("租借", for: .normal)
            
            let url = URL(string: "http://127.0.0.1:5000/returnCar?id=\(motorD!.id)")!
            print(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.addValue("application/json", forHTTPHeaderField: "Accept")

            let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                        //the service response is here
                print(response!)
            })

            task.resume()
            
            performSegue(withIdentifier: "rentToHistory", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        
        print("rent motor:",motorD!)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rentPageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        rentPageTableView.delegate = self
        rentPageTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RentCell", for: indexPath) as! rentPageTableViewCell
        
        let motor = motorD
        cell.carId.text = motor!.id
        cell.batteryValue.text = String(motor!.battery)
        cell.distanceValue.text = "300"
        return cell
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
