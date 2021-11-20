//
//  PasswordViewController.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/17.
//

import UIKit

class PasswordViewController: UIViewController {
    var flag = ""
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if phoneNumber.text == "0912345678"{
            flag = "user"
            performSegue(withIdentifier: "GoToUser", sender: nil)
        /*
            if let controller = storyboard?.instantiateViewController(withIdentifier: "userfirstpage") {
                present(controller, animated: true, completion: nil)
            }
        */
        }
        else{
            flag = "editer"
            performSegue(withIdentifier: "GoToEditer", sender: nil)
        /*
            if let controller = storyboard?.instantiateViewController(withIdentifier: "editerfirstpage") {
                present(controller, animated: true, completion: nil)
            }
         */
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
