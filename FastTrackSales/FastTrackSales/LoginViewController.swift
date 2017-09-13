//
//  LoginViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 03/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit
import QuartzCore

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var btnLogin: UIButton?
    @IBOutlet var btnRegister: UIButton?
    @IBOutlet var tfUsername: UITextField?
    @IBOutlet var tfPassword: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfUsername?.delegate = self
        tfPassword?.delegate = self
        btnLogin?.layer.cornerRadius = 5
        btnLogin?.layer.masksToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tfUsername?.text = nil
        tfPassword?.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //User login functional validation
    
    @IBAction func btnLoginPressed(_sender: UIButton){
        
        if(tfUsername?.text == "abc@gmail.com") && (tfPassword?.text == "1234"){
        
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeControllerObj = storyBoard.instantiateViewController(withIdentifier: "HomeControllerSBID") as! HomeViewController
            self.navigationController?.pushViewController(homeControllerObj, animated: true)
        }
        else{
            
            let alertObj = UIAlertController(title: "Alert", message: "Invalid credentials! Please enter the correct credentials and try again.", preferredStyle: UIAlertControllerStyle.alert)
            alertObj.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertObj, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    //MARK:- UITextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (textField == tfUsername) {
            textField.resignFirstResponder()
            tfPassword?.becomeFirstResponder()
        }
        else if (textField == tfPassword) {
            textField.resignFirstResponder()
        }
        
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
