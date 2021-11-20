//
//  changePage2ViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/22.
//

import UIKit

class changePage2ViewController: UIViewController {
     
    
    @IBOutlet weak var carID: UITextField!
    @IBOutlet weak var rate: UITextField!
    
    
    
    
    @IBAction func firstPage(_ sender: Any) {
        performSegue(withIdentifier: "changeToFirst", sender: nil)
    }
    @IBAction func historyPage(_ sender: Any) {
        performSegue(withIdentifier: "changeToHistory", sender: nil)
    }
    @IBAction func profilePage(_ sender: Any) {
        performSegue(withIdentifier: "changeToProfile", sender: nil)
    }
    
    
    @IBAction func newCarButton(_ sender: Any) {
        
        print(carID.text)
        print(rate.text)
        
        
        let url = URL(string: "http://127.0.0.1:5000/newCar?id=\(carID.text!)&rate=\(rate.text!)")!
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            //print(response!)
        })

        task.resume()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
