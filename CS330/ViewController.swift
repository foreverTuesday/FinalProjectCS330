//
//  ViewController.swift
//  CS330
//
//  Created by Mikaela Scheff on 3/29/17.
//  Copyright © 2017 Mikaela Scheff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//pre-existing stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]


        GlobalVariable.clickMultiplier = 1
        //print(MenuViewController.GlobalVariable.myString)
        NotificationCenter.default.addObserver(self, selector: #selector(self.bankText), name: NSNotification.Name(rawValue: "UpdateBankText"), object: nil)
            //print("I got to viewDidLoad")
        let title = "Instructions"
        let message = "Welcome to coaster clicker.  The goal of the game is to get as many coins as possible.  Every time you click the big coin, you get one coin.  In the menu, you can buy upgrades to help you get coins faster.  Click \"Start\" when you are ready to begin."
        let alertView: UIAlertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "Start")
        // alertView.alertViewStyle = .default
        alertView.show()

    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //let tempBank = MenuViewController.GlobalVariable.tempBank + GlobalVariable.safeStore
        //updateBank(num: tempBank)
        
        updateBank(num: MenuViewController.GlobalVariable.tempBank)
        
        GlobalVariable.safeCheck = true
        GlobalVariable.safeStore = 0
        //print("I got to viewWillAppear")
    }
   
    
    
    
    override func viewWillDisappear(_ animated: Bool){  //function that gets called when the view disappears
        //print("VC vanished!")
    }

//variables
    var clicks = 0
    //var secondClick = false
    
//main button
    @IBAction func mainButton(_ sender: AnyObject) {
    //update overall clicks
        clicks += 1
        GlobalVariable.inBank = GlobalVariable.inBank + (GlobalVariable.clickMultiplier)
       //hard mode where a user must click twice for one coin
        /*if secondClick==true{
            clicks += 1/*clicks + 1*/
            secondClick = false
            GlobalVariable.inBank = GlobalVariable.inBank + (GlobalVariable.clickMultiplier)
        }
        else{
            secondClick=true
        }*/
        clickCount.text = "Number of clicks: \(clicks)"
    //update bank by adding the correct number of coins
        
        bankText()

        //GlobalVariable.test()
        //GlobalVariable.initiateTimer()
    }
    
//click count label
    @IBOutlet weak var clickCount: UILabel!

//click bank label
    @IBOutlet weak var clickBank: UILabel!
    
    
//update inBank and bank label
    func updateBank(num: Int){
        GlobalVariable.inBank = num
        bankText()
    }
    
    func bankText(){
        clickBank.text = "Bank: \(GlobalVariable.inBank)"
    }

//timers
    //first upgrade timer
    static func initiateTimer(){
        GlobalVariable.SwiftTimer = Timer.scheduledTimer(timeInterval: 10, target:self, selector: Selector("updateCounter")/*selector: #selector(ViewController.GlobalVariable.updateCounter)*/, userInfo: nil, repeats: true)
    }
    
    static func updateCounter() {
        GlobalVariable.SwiftCounter =  GlobalVariable.SwiftCounter + 1  //increment the counter
        //print(GlobalVariable.SwiftCounter)
        GlobalVariable.inBank = GlobalVariable.inBank + 1
        if (GlobalVariable.safeCheck == true){
            //print("Safecheck is true")
            NotificationCenter.default.post(name: Notification.Name("UpdateBankText"), object: nil)  //update the bank label
            //ViewController().bankText()
        }
        else{
            //print("Safecheck is false")
            GlobalVariable.safeStore = GlobalVariable.safeStore + 1  //keep track of how many coins need to be added
            //print("Safestore = \(GlobalVariable.safeStore)")
        }
    }


//update safeStore
   /* func updateSafeStore(){
        safeStore = safeStore + 1
        print("safeStore: \(safeStore)")
    }*/
 //second upgrade timer
    static func initiateTimer2(){
        GlobalVariable.SwiftTimer2 = Timer.scheduledTimer(timeInterval: 5, target:self, selector: Selector("updateCounter2")/*selector: #selector(ViewController.GlobalVariable.updateCounter)*/, userInfo: nil, repeats: true)
    }
    
    static func updateCounter2() {
        GlobalVariable.SwiftCounter2 =  GlobalVariable.SwiftCounter2 + 1  //increment the counter
        //print(GlobalVariable.SwiftCounter)
        GlobalVariable.inBank = GlobalVariable.inBank + 1
        if (GlobalVariable.safeCheck == true){
            //print("Safecheck is true")
            NotificationCenter.default.post(name: Notification.Name("UpdateBankText"), object: nil)  //update the bank label
            //ViewController().bankText()
        }
        else{
            //print("Safecheck is false")
            GlobalVariable.safeStore = GlobalVariable.safeStore + 1  //keep track of how many coins need to be added
            //print("Safestore = \(GlobalVariable.safeStore)")
        }
    }


//function for debugging
   /* func debug(){
        print("I got to the debug function")
    }*/

    

    
//Global Variables
    struct GlobalVariable{
        static var inBank = 0
        static var clickMultiplier = Int()
        /*static func updateBank(num: Int){
            //update inBank and the bank label
        }*/
        
    //timers
        static var SwiftTimer = Timer()
        static var SwiftCounter = 0
        static func initiateTimer(){
            ViewController.initiateTimer()
            
            /*SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: Selector("updateCounter")/*selector: #selector(updateCounter)*/, userInfo: nil, repeats: true)*/
            
        }
        static var SwiftTimer2 = Timer()
        static var SwiftCounter2 = 0
        static func initiateTimer2(){
            ViewController.initiateTimer2()
        }
        
    //how to handle timer stuff while in MenuViewController
        static var safeCheck = Bool() //so that bankText doesn't get run while in MenuViewController
        static var safeStore = Int()
        
        /*static func test(){
            ViewController.debug()
        }*/
        
        
    } //end of GlobalVariable
    
    
    
    

}

