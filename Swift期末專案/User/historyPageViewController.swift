//
//  historyPageViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/20.
//

import UIKit

class historyPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    @IBAction func firstPageButton(_ sender: Any) {
        performSegue(withIdentifier: "historyToFirst", sender: nil)
    }
    @IBAction func profilePageButton(_ sender: Any) {
        performSegue(withIdentifier: "historyToProfile", sender: nil)
    }
    
    override func viewDidLoad() {
        getRecordData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    var recordData = [accountRecord]()
    
    func getRecordData() {
        let address = "http://127.0.0.1:5000/getRecord"
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print("Status code: \(response.statusCode)")
                    print("haha")
                    print(data)
                    if let recordD = try? JSONDecoder().decode([accountRecord].self, from: data) {
                        DispatchQueue.main.async{
                            print("this is ",recordD)
                            self.recordData = recordD
                            self.historyTableView.reloadData()
                        }
                    }else{ print("decoded failed") }
                    //print("this is data ",self.motorBikeData)
                }
            }.resume()
        } else {
            print("Invalid URL.")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! historyTableViewCell
        //tableView.reloadData()
        let record = recordData[indexPath.row]
        cell.rentDate.text = record.date
        cell.carIDLabel.text = record.id
        cell.rentTimeLabel.text = record.time
        cell.moneyLabel.text = String(record.cost)
        
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
