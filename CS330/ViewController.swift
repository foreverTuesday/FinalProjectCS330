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
        GlobalVariable.clickMultiplier = 1
        //print(MenuViewController.GlobalVariable.myString)
        
            //print("I got to viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //let tempBanK = MenuViewController.GlobalVariable.tempBank + GlobalVariable.safeStore
        //updateBank(num: tempBanK)
        
        updateBank(num: MenuViewController.GlobalVariable.tempBank)
        
        GlobalVariable.safeCheck = true
        //GlobalVariable.safeStore = 0
        //print("I got to viewWillAppear")
    }
    
//variables
    var clicks = 0
    
    
//main button
    @IBAction func mainButton(_ sender: AnyObject) {
    //update overall clicks
        clicks = clicks + 1
        clickCount.text = "Number of clicks: \(clicks)"
    //update bank by adding the correct number of coins
        GlobalVariable.inBank = GlobalVariable.inBank + (GlobalVariable.clickMultiplier)
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

//timer
    static func initiateTimer(){
        GlobalVariable.SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: Selector("updateCounter")/*selector: #selector(ViewController.GlobalVariable.updateCounter)*/, userInfo: nil, repeats: true)
    }
    
    static func updateCounter() {
        GlobalVariable.SwiftCounter =  GlobalVariable.SwiftCounter + 1  //increment the counter
        //print(GlobalVariable.SwiftCounter)
        GlobalVariable.inBank = GlobalVariable.inBank + 1
        if (GlobalVariable.safeCheck == true){
            print("Safecheck is true")
            ViewController().bankText()
        }
        else{
            //print("Safecheck is false")
            GlobalVariable.safeStore = GlobalVariable.safeStore + 1
            //print("Safestore = \(GlobalVariable.safeStore)")
            //ViewController().updateSafeStore()
        }
    }


//update safeStore
   /* func updateSafeStore(){
        safeStore = safeStore + 1
        print("safeStore: \(safeStore)")
    }*/


//function for debugging
    func debug(){
        print("I got to the debug function")
    }

    

    
//Global Variables
    struct GlobalVariable{
        static var inBank = 0
        static var clickMultiplier = Int()
        /*static func updateBank(num: Int){
            //update inBank and the bank label
        }*/
        
    //timer
        static var SwiftTimer = Timer()
        static var SwiftCounter = 0
        static func initiateTimer(){
            ViewController.initiateTimer()
            
            /*SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: Selector("updateCounter")/*selector: #selector(updateCounter)*/, userInfo: nil, repeats: true)*/
        }
    //how to handle timer stuff while in MenuViewController
        static var safeCheck = Bool() //so that bankText doesn't get run while in MenuViewController
        static var safeStore = Int()
        
        /*static func test(){
            ViewController.debug()
        }*/
        
        
    } //end of GlobalVariable
    
    
    
    

}

