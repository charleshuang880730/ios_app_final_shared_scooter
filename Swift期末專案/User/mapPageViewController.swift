//
//  mapPageViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/20.
//

import UIKit

class mapPageViewController: UIViewController {
    
    var motorD: motorBike? = nil
    
    @IBAction func rentButton(_ sender: Any) {
        performSegue(withIdentifier: "GoToRentPage", sender: motorD)
    }
    
    override func viewDidLoad() {
        print("map motor:",motorD as Any)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GoToRentPage":
            let motor = sender as! motorBike
            
            let destination = segue.destination
            let motorInfoVC = destination as! rentPageViewController
            
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
