//
//  CustomerProfileViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 06/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class CustomerProfileViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet var btnCancel: UIButton?
    @IBOutlet var btnSave: UIButton?
    @IBOutlet var btnEditContact: UIButton?
    @IBOutlet var btnEditEmail: UIButton?
    @IBOutlet var btnEditAddress: UIButton?
    @IBOutlet var btnEditProfilePhoto: UIButton?
    @IBOutlet var ivCustomerProfilePic: UIImageView?
    @IBOutlet var tfName: UITextField?
    @IBOutlet var tfContact: UITextField?
    @IBOutlet var tfEmail: UITextField?
    @IBOutlet var tvAddress: UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfName?.delegate = self
        tfContact?.delegate = self
        tfEmail?.delegate = self
        tvAddress?.delegate = self
        
        tfName?.isUserInteractionEnabled = false
        tfContact?.isUserInteractionEnabled = false
        tfEmail?.isUserInteractionEnabled = false
        tvAddress?.isUserInteractionEnabled = false
        
        self.changeActionButtonsState(isEnable: false)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        

    }
    
    func changeActionButtonsState(isEnable:Bool) {
        if isEnable {
            btnSave?.isEnabled = true
            btnCancel?.isEnabled = true
        }else{
            btnSave?.isEnabled = false
            btnCancel?.isEnabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Buttons actions
    
    @IBAction func btnCancelPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: false)
    }
    
    @IBAction func btnSavePressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: false)
    }
    
    @IBAction func btnEditContactPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        tfContact?.isUserInteractionEnabled = true
    }
    @IBAction func btnEditEmailPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        tfEmail?.isUserInteractionEnabled = true
    }
    @IBAction func btnEditAddressPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        tvAddress?.isUserInteractionEnabled = true
    }
    
    @IBAction func btnEditProfilePhoto(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        
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
