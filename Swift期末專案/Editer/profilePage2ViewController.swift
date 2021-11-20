//
//  profilePage2ViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/22.
//

import UIKit

class profilePage2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var profile2TableView: UITableView!
    
    @IBOutlet weak var earnMoney: UILabel!
    
    @IBAction func firstButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToFirst2", sender: nil)
    }
    @IBAction func historyButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToHistory2", sender: nil)
    }
    
    var money: Int = 0
    
    func getEarnMoney(){
        let address = "http://127.0.0.1:5000/earn"
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print(data)
                    print("Status code: \(response.statusCode)")
                    if let earnData = try? JSONDecoder().decode(Int.self, from: data) {
                        DispatchQueue.main.async{
                            print("success")
                            self.money = earnData
                            print("money:",self.money)
                            self.profile2TableView.reloadData()
                        }
                    }else{print("decode failed")}
                }
            }.resume()
        } else {
            print("Invalid URL.")
        }
    }
    
    override func viewDidLoad() {
        getEarnMoney()
        earnMoney.text = String(money)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profile2TableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        profile2TableView.delegate = self
        profile2TableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Profile2Cell", for: indexPath) as! profile2TableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToNewCar", sender: nil)
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
