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

class HomeViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate,UITableViewDataSource, UITableViewDelegate, ProductItemCollectionViewCellDelegate {
    
    @IBOutlet var btnBack: UIButton?
    @IBOutlet var btnLogout: UIButton?
    @IBOutlet var btnPromotions: UIButton?
    @IBOutlet var btnCart: UIButton?
    @IBOutlet var btnTrackOrder: UIButton?
    @IBOutlet var btnOrderHistory: UIButton?
    @IBOutlet var ivCustomerProfilePic: UIImageView?
    @IBOutlet var lblHeaderTitle: UILabel?
    
    @IBOutlet var colVwProduct: UICollectionView?
    
    @IBOutlet var profileView: UIView?
    @IBOutlet var promotiondView: UIView?
    @IBOutlet var cartView: UIView?
    @IBOutlet var trackOrderView: UIView?
    @IBOutlet var orderHistoryView: UIView?
    
    
    //Profile setting
    @IBOutlet var btnCancel: UIButton?
    @IBOutlet var btnSave: UIButton?
    @IBOutlet var btnEditContact: UIButton?
    @IBOutlet var btnEditEmail: UIButton?
    @IBOutlet var btnEditAddress: UIButton?
    @IBOutlet var btnEditProfilePhoto: UIButton?
    @IBOutlet var ivCustomerProfilePicLarge: UIImageView?
    @IBOutlet var tfName: UITextField?
    @IBOutlet var tfContact: UITextField?
    @IBOutlet var tfEmail: UITextField?
    @IBOutlet var tvAddress: UITextView?
    ////
    
    //Promotion view component
    @IBOutlet var tblVwPromotions: UITableView?
    @IBOutlet var lblPromotionTitleText: UILabel?
    ///////
    
     //Cart view component
    @IBOutlet var tblVwCart: UITableView?
    @IBOutlet var lblTotalSubText: UILabel?
    @IBOutlet var lblTotalValueText: UILabel?
    @IBOutlet var lblVatAmountValue: UILabel?
    @IBOutlet var btnCancelCart: UIButton?
    @IBOutlet var btnOrderNow: UIButton?
    
    var grandTotalValueCart:Double = 0.0
    let vatAmount:Double = 10.0
    
    ////
    
    //Track order
    @IBOutlet var tblVwTrackOrders: UITableView?
    
    ///////
    
    //Order history
     @IBOutlet var tblVwOrderHistory: UITableView?
    
    ///////
    
    var isHomeScreen:Bool = true
    let btnLogoutPosActual:CGPoint = CGPoint(x:76, y:30)
    let btnLogoutPosTransform:CGPoint = CGPoint(x:16, y:30)
    let btnSize:CGSize = CGSize(width:42, height:36)
    
    var productsName = ["L&M REGULAR CUT RED 100 BOX 19 201508", "L&M REGULAR CUT BLUE 100 BOX 19 201508", "Marlboro Fuse Beyond 19s 20150101 56kr", "MARLBORO BRIGHT BEYOND 201510", "MARLBORO FINE BEYOND 19s 201511", "Marlboro Fuse Beyond 19s 20150101 (OLD-PACK)"]
    var productsQuantuty = ["140 Box(7.00$/Box)", "110 Box(6.45$/Box)", "90 Box(5.95$/Box)", "165 Box(7.25$/Box)", "180 Box(6.80$/Box)", "140 Box(7.00$/Box)"]
    var productImages = ["L&M_RegularCut_Red.png", "L&M_RegularCut_Blue.png", "MarlboroFuse.png", "MarlboroBright.png", "MarlboroFine.png", "MarlboroFuse.png"]
    
    var productImagesPromotions = ["promo_MarlboroClove.png", "promo_MarlboroIce.png", "promo_MarlboroMenthol.png"]
    
    var productImagesCart = ["history_LMRed.png","history_LMBlue.png"]
    var productNameCart = ["L&M REGULAR CUT RED 100 BOX 19 201508","L&M REGULAR CUT BLUE 100 BOX 19 201509"]
    var productQtyCart = ["5","10"]
    
    
    var productImagesOrderHistory = ["history_LMBlue.png", "history_LMRed.png", "history_MarlboroFuse.png"]
    var productOrderIDOrderHistory = ["PMIORDGHYF098756", "PMIORDGHYF098757", "PMIORDGHYF098758"]
    var productOrderQtyOrderHistory = ["5", "10", "8"]
    var productOrderDateOrderHistory = ["Mon 24th Jul, 2017", "Wed 24th Jun, 2017", "Fri 24th Apr, 2017"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        //Adding tap gesture into the customer profile pic
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profilePicTapped))
        ivCustomerProfilePic?.isUserInteractionEnabled = true
        ivCustomerProfilePic?.addGestureRecognizer(tapGestureRecognizer)
        
        colVwProduct?.delegate = self
        colVwProduct?.dataSource = self
        
        
        //Profile setting
        tfName?.delegate = self
        tfContact?.delegate = self
        tfEmail?.delegate = self
        tvAddress?.delegate = self
        
        tfName?.isUserInteractionEnabled = false
        tfContact?.isUserInteractionEnabled = false
        tfEmail?.isUserInteractionEnabled = false
        tvAddress?.isUserInteractionEnabled = false
        btnSave?.layer.cornerRadius = 5
        btnSave?.layer.masksToBounds = true
        btnCancel?.layer.cornerRadius = 5
        btnCancel?.layer.masksToBounds = true
        
        self.changeActionButtonsState(isEnable: false)
        /////
        
        //Promotions
        tblVwPromotions?.delegate = self;
        tblVwPromotions?.dataSource = self;
        self.tblVwPromotions?.separatorStyle = UITableViewCellSeparatorStyle.none
        /////
        
        ///Cart
        tblVwCart?.delegate = self
        tblVwCart?.dataSource = self
        self.tblVwCart?.separatorStyle = UITableViewCellSeparatorStyle.none
        btnCancelCart?.layer.cornerRadius = 5
        btnCancelCart?.layer.masksToBounds = true
        btnOrderNow?.layer.cornerRadius = 5
        btnOrderNow?.layer.masksToBounds = true
        
        //////
        
        //Track order
        tblVwTrackOrders?.delegate = self;
        tblVwTrackOrders?.dataSource = self;
        self.tblVwTrackOrders?.separatorStyle = UITableViewCellSeparatorStyle.none
        ////////////
        
        //Order History
        tblVwOrderHistory?.delegate = self;
        tblVwOrderHistory?.dataSource = self;
        self.tblVwOrderHistory?.separatorStyle = UITableViewCellSeparatorStyle.none
        ///////
        
        self.view.addSubview(profileView!)
        profileView?.isHidden = true
        
        self.view.addSubview(cartView!)
        cartView?.isHidden = true
        
        self.view.addSubview(promotiondView!)
        promotiondView?.isHidden = true
        
        self.view.addSubview(trackOrderView!)
        trackOrderView?.isHidden = true
        
        self.view.addSubview(orderHistoryView!)
        orderHistoryView?.isHidden = true
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
        
        profileView?.frame = CGRect(x:10, y:94, width:1004, height:536)
        //self.view.addSubview(profileView!)
        profileView?.isHidden = false
        
        self.clearSubviewsForViewWithTag(viewTag: 2)
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
        
        tfContact?.resignFirstResponder()
        tfEmail?.resignFirstResponder()
        tvAddress?.resignFirstResponder()

        for viewRef:UIView in self.view.subviews{
            
            if viewRef.tag == 2{
                //viewRef.removeFromSuperview()
                viewRef.isHidden = true
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 5{
                //viewRef.removeFromSuperview()
                viewRef.isHidden = true
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 6{
                //viewRef.removeFromSuperview()
                viewRef.isHidden = true
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 3{
                //viewRef.removeFromSuperview()
                viewRef.isHidden = true
                isHomeScreen = true
                self.refreshHomeController()
            }
            if viewRef.tag == 4{
                //viewRef.removeFromSuperview()
                viewRef.isHidden = true
                isHomeScreen = true
                self.refreshHomeController()
            }
        }
        colVwProduct?.isHidden=false
        colVwProduct?.reloadData()
        
    }
    
    @IBAction func btnPromotionsPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Promotions"
        isHomeScreen = false
        
        promotiondView?.frame = CGRect(x:10, y:94, width:1024, height:536)
        //self.view.addSubview(promotiondView!)
        promotiondView?.isHidden = false
        
        self.clearSubviewsForViewWithTag(viewTag: 3)
        self.refreshHomeController()
        tblVwPromotions?.reloadData()
    }
    
    @IBAction func btnCartPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Cart"
        isHomeScreen = false
        
        cartView?.frame = CGRect(x:10, y:94, width:1024, height:536)
        //self.view.addSubview(cartView!)
        cartView?.isHidden = false
        
        self.clearSubviewsForViewWithTag(viewTag: 4)
        self.refreshHomeController()
        tblVwCart?.reloadData()
        
        
        self.lblVatAmountValue?.text = String(format: "10.00$")
        
        let grandTotalWithVat:Double = self.grandTotalValueCart + self.vatAmount
        
        
        //self.lblTotalValueText?.text = String(format: "%.2f$",self.grandTotalValueCart)
        
        self.lblTotalValueText?.text = String(format: "%.2f$",grandTotalWithVat)
        
        self.grandTotalValueCart = 0.0
    }
    
    @IBAction func btnTrackOrdersPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Track Orders"
        isHomeScreen = false
        
        trackOrderView?.frame = CGRect(x:10, y:94, width:1024, height:536)
        //self.view.addSubview(trackOrderView!)
        trackOrderView?.isHidden = false
        
        self.clearSubviewsForViewWithTag(viewTag: 5)
        self.refreshHomeController()
        tblVwTrackOrders?.reloadData()
    }
    
    @IBAction func btnOrderHistoryPressed(_sender: UIButton){
        lblHeaderTitle?.text = "Order History"
        isHomeScreen = false
        
        orderHistoryView?.frame = CGRect(x:10, y:94, width:1024, height:536)
        //self.view.addSubview(orderHistoryView!)
        orderHistoryView?.isHidden = false
        
        self.clearSubviewsForViewWithTag(viewTag: 6)
        self.refreshHomeController()
        tblVwOrderHistory?.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    
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
    
    func clearSubviewsForViewWithTag(viewTag: NSInteger){
        
        colVwProduct?.isHidden=true
        
        for viewRef:UIView in self.view.subviews{
            if ((viewRef.tag != 1) && (viewRef.tag != 0)) && (viewRef.tag != viewTag) {
                //viewRef.removeFromSuperview()
                viewRef.isHidden = true
            }
        }
    }
    
    //func scrollViewDidScroll(_ scrollView: UIScrollView) {
       // NSLog("Table view scroll detected at offset: %f", scrollView.contentOffset.y)
    //}
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tblVwPromotions{
            return 3
        }
        else if tableView == tblVwCart{
            return 2
        }
        else if tableView == tblVwTrackOrders{
            return 3
        }
        else if tableView == tblVwOrderHistory{
            return 3
        }
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        if tableView == tblVwPromotions{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionsCellID", for: indexPath) as! PromotionsTableViewCell
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            cell.imgVwPromoProduct?.image = UIImage(named: productImagesPromotions[indexPath.row])
            return cell
        }
        
        else if tableView == tblVwCart{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartCellID", for: indexPath) as! CartTableViewCell
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            cell.btnCancelOrDelete?.layer.cornerRadius = 5
            cell.btnCancelOrDelete?.layer.masksToBounds = true
            cell.imgVwProductOrder?.image = UIImage(named: productImagesCart[indexPath.row])
            cell.lblProductNameText?.text = productNameCart[indexPath.row]
            cell.txtFieldQuantity?.text = productQtyCart[indexPath.row];
            
            let qtyVal:Int = Int((cell.txtFieldQuantity?.text)!)!
            
            let totalVal:Double = Double(qtyVal*7)
            
            cell.lblTotalAmountText?.text = String (format:"%.2f$",totalVal)
            
            self.grandTotalValueCart =  self.grandTotalValueCart + totalVal
            
            
            return cell
        }
        
        else if tableView == tblVwTrackOrders{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrackOrdersCellID", for: indexPath) as! TrackOrdersTableViewCell
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            cell.btnCancelOrder?.layer.cornerRadius = 5
            cell.btnCancelOrder?.layer.masksToBounds = true
            cell.btnViewOrderDetails?.layer.cornerRadius = 5
            cell.btnViewOrderDetails?.layer.masksToBounds = true
            return cell
        }
        else if tableView == tblVwOrderHistory{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCellID", for: indexPath) as! OrderHistoryTableViewCell
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            cell.btnVwDetailsText?.layer.cornerRadius = 5
            cell.btnVwDetailsText?.layer.masksToBounds = true
            cell.imgVwProduct?.image = UIImage(named: productImagesOrderHistory[indexPath.row])
            cell.lblOrderIdText?.text = productOrderIDOrderHistory[indexPath.row]
            cell.lblQuantityText?.text = productOrderQtyOrderHistory[indexPath.row]
            cell.lblDeliveryDateText?.text = productOrderDateOrderHistory[indexPath.row]
            return cell
        }
   
        return cell
    }
    
    //Profile Setting
    func changeActionButtonsState(isEnable:Bool) {
        if isEnable {
            btnSave?.isEnabled = true
            btnCancel?.isEnabled = true
            
            btnSave?.alpha = 1.0
            btnCancel?.alpha = 1.0
        }else{
            btnSave?.isEnabled = false
            btnCancel?.isEnabled = false
            
            btnSave?.alpha = 0.65
            btnCancel?.alpha = 0.65
        }
    }
    
    func setEditableFieldUserInteraction(userInteractionState: Bool) {
        
        tfContact?.isUserInteractionEnabled = userInteractionState
        tfEmail?.isUserInteractionEnabled = userInteractionState
        tvAddress?.isUserInteractionEnabled = userInteractionState
        
    }
    
    //MARK:- Profile settings buttons actions
    
    @IBAction func btnCancelPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: false)
        self.setEditableFieldUserInteraction(userInteractionState: false)
    }
    
    @IBAction func btnSavePressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: false)
        self.setEditableFieldUserInteraction(userInteractionState: false)
    }
    
    @IBAction func btnEditContactPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        tfContact?.isUserInteractionEnabled = true
        tfContact?.becomeFirstResponder()
    }
    @IBAction func btnEditEmailPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        tfEmail?.isUserInteractionEnabled = true
        tfEmail?.becomeFirstResponder()
    }
    @IBAction func btnEditAddressPressed(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        tvAddress?.isUserInteractionEnabled = true
        tvAddress?.becomeFirstResponder()
    }
    
    @IBAction func btnEditProfilePhoto(_sender: UIButton){
        self.changeActionButtonsState(isEnable: true)
        
    }
    
    ////#######/////////
    
    
    //MARK : UITextfield delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    //MARK : ProductItemCollectionViewCellDelegate method
    func addToCartSelected()  {  //(colViewCellObj: ProductItemCollectionViewCell) {
        print("add to cart pressed")
    }  

}



