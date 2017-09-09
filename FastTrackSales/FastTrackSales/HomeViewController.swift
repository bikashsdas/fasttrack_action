//
//  HomeViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 03/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit
import QuartzCore

/*Note for reference:
 View tag number -->
 HomeViewController : 1
 CustomerProfileViewController : 2
 PromotionsViewController : 3
 CartViewController : 4
 TrackOrdersViewController : 5
 OrderHistoryViewController : 6
 
 topbar height : 84
 bottombar height : 128
 
 working area height : 768 - (84+128) = 556
 
 */

class HomeViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var btnBack: UIButton?
    @IBOutlet var btnLogout: UIButton?
    @IBOutlet var btnPromotions: UIButton?
    @IBOutlet var btnCart: UIButton?
    @IBOutlet var btnTrackOrder: UIButton?
    @IBOutlet var btnOrderHistory: UIButton?
    @IBOutlet var ivCustomerProfilePic: UIImageView?
    @IBOutlet var lblHeaderTitle: UILabel?
    
    @IBOutlet var colVwProduct: UICollectionView?
    
    var isHomeScreen:Bool = true
    let btnLogoutPosActual:CGPoint = CGPoint(x:76, y:30)
    let btnLogoutPosTransform:CGPoint = CGPoint(x:16, y:30)
    let btnSize:CGSize = CGSize(width:42, height:36)
    
    var productsName = ["L&M REGULAR CUT RED 100 BOX 19 201508", "L&M REGULAR CUT BLUE 100 BOX 19 201508", "Marlboro Fuse Beyond 19s 20150101 56kr", "MARLBORO BRIGHT BEYOND 201510", "MARLBORO FINE BEYOND 19s 201511", "Marlboro Fuse Beyond 19s 20150101 (OLD-PACK)"]
    var productsQuantuty = ["140 Box(7.00$/Box)", "110 Box(6.45$/Box)", "90 Box(5.95$/Box)", "165 Box(7.25$/Box)", "180 Box(6.80$/Box)", "140 Box(7.00$/Box)"]
    var productImages = ["L&M_RegularCut_Red.png", "L&M_RegularCut_Blue.png", "MarlboroFuse.png", "MarlboroBright.png", "MarlboroFine.png", "MarlboroFuse.png"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Adding tap gesture into the customer profile pic
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profilePicTapped))
        ivCustomerProfilePic?.isUserInteractionEnabled = true
        ivCustomerProfilePic?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isHomeScreen {
            btnBack?.isHidden = true
            btnLogout?.frame = CGRect(x:btnLogoutPosTransform.x,y:btnLogoutPosTransform.y,width:btnSize.width,height:btnSize.height)
        }else{
            btnBack?.isHidden = false
            btnLogout?.frame = CGRect(x:btnLogoutPosActual.x,y:btnLogoutPosActual.y,width:btnSize.width,height:btnSize.height)
        }
        
    }
    
    func refreshHomeController() {
        if isHomeScreen {
            lblHeaderTitle?.text = "Dashboard"
            btnBack?.isHidden = true
            btnLogout?.frame = CGRect(x:btnLogoutPosTransform.x,y:btnLogoutPosTransform.y,width:btnSize.width,height:btnSize.height)
        }else{
            btnBack?.isHidden = false
            btnLogout?.frame = CGRect(x:btnLogoutPosActual.x,y:btnLogoutPosActual.y,width:btnSize.width,height:btnSize.height)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Profile setting page navigation
    @objc func profilePicTapped() {
        print("Profile pic tapped")
        
        lblHeaderTitle?.text = "Profile Settings"
        isHomeScreen = false
        //btnBack?.isHidden = false
        //btnLogout?.frame = CGRect(x:btnLogoutPosActual.x,y:btnLogoutPosActual.y,width:btnSize.width,height:btnSize.height)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let customerProfileObj = storyBoard.instantiateViewController(withIdentifier: "CustomerProfileSBID") as! CustomerProfileViewController
        customerProfileObj.view.frame = CGRect(x:10, y:94, width:1024, height:536)
        self.view.addSubview(customerProfileObj.view)
        
        self.refreshHomeController()
    }
    
    //MARK:- Buttons actions
    
    @IBAction func logoutPressed(_sender: UIButton){
        
        let alertObj = UIAlertController(title: "Alert", message: "You are about to logout from the system. Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        alertObj.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        alertObj.addAction(UIAlertAction(title:"Yes", style: UIAlertActionStyle.default, handler:{(action:UIAlertAction!) in
            self.navigationController?.popViewController(animated: true) //navigating to login screen
        }))
        
        self.present(alertObj, animated: true, completion: nil)
    }
    
    @IBAction func btnBackPressed(_sender: UIButton){
        

        for viewRef:UIView in self.view.subviews{
            if viewRef.tag == 2{
                viewRef.removeFromSuperview()
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 5{
                viewRef.removeFromSuperview()
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 6{
                viewRef.removeFromSuperview()
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 3{
                viewRef.removeFromSuperview()
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 4{
                viewRef.removeFromSuperview()
                isHomeScreen = true
                self.refreshHomeController()
            }
        }
        
    }
    
    @IBAction func btnPromotionsPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Promotions"
        isHomeScreen = false
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let promotionsObj = storyBoard.instantiateViewController(withIdentifier: "PromotionsSBID") as! PromotionsViewController
        promotionsObj.view.frame = CGRect(x:10, y:94, width:1024, height:536)
        self.view.addSubview(promotionsObj.view)
        
        self.refreshHomeController()
    }
    
    @IBAction func btnCartPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Cart"
        isHomeScreen = false
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let cartObj = storyBoard.instantiateViewController(withIdentifier: "CartSBID") as! CartViewController
        cartObj.view.frame = CGRect(x:10, y:94, width:1024, height:536)
        self.view.addSubview(cartObj.view)
        
        self.refreshHomeController()
    }
    
    @IBAction func btnTrackOrdersPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Track Orders"
        isHomeScreen = false
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let trackOrdersObj = storyBoard.instantiateViewController(withIdentifier: "TrackOrdersSBID") as! TrackOrdersViewController
        trackOrdersObj.view.frame = CGRect(x:10, y:94, width:1024, height:536)
        self.view.addSubview(trackOrdersObj.view)
        
        self.refreshHomeController()
    }
    
    @IBAction func btnOrderHistoryPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Order History"
        isHomeScreen = false
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let orderHistoryObj = storyBoard.instantiateViewController(withIdentifier: "OrderHistorySBID") as! OrderHistoryViewController
        orderHistoryObj.view.frame = CGRect(x:10, y:94, width:1024, height:536)
        self.view.addSubview(orderHistoryObj.view)
        
        self.refreshHomeController()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return productsName.count
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductItemCollectionCellID", for: indexPath as IndexPath) as! ProductItemCollectionViewCell
        
        cell.btnAddToCart?.layer.cornerRadius = 5
        cell.btnAddToCart?.layer.masksToBounds = true
        cell.lblItemNameText?.text = productsName[indexPath.item]
        cell.lblAvailableQuantityText?.text = productsQuantuty[indexPath.item]
        cell.imgVwPoductItem?.image = UIImage(named: productImages[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    

}
