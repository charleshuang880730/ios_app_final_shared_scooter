//
//  profilePageViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/20.
//

import UIKit

class profilePageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myMoney = 1000
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var moneyValue: UILabel!
    
    @IBOutlet weak var profileTableView: UITableView!
    
    @IBAction func firstPageButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToFirst", sender: nil)
    }
    @IBAction func historyPageButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToHistory", sender: nil)
    }
    
    override func viewDidLoad() {
        moneyValue.text = String(myMoney)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        profileTableView.delegate = self
        profileTableView.dataSource = self
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! profileTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myMoney = myMoney+1000
        self.moneyValue.text = String(myMoney)
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
