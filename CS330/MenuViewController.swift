//
//  MenuViewController.swift
//  CS330
//
//  Created by Mikaela Scheff on 4/6/17.
//  Copyright © 2017 Mikaela Scheff. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    //GlobalVariable.myString = "Hello"
        ViewController.GlobalVariable.safeCheck = false
        
        var buttonArray = [toggleUp1,toggleUp2,toggleUp3,toggleUp4] //create button outlet array
        //showUpgrades(ar: buttonArray)
        

    // Do any additional setup after loading the view.
        

    //print("I got to viewDidLoad in MenuViewController")
    
        GlobalVariable.tempBank = ViewController.GlobalVariable.inBank //put the right number into tempBank
        bankLabel.text = "Bank: \(GlobalVariable.tempBank)"  //display the right number in bankLabel

        var counter = 0
        for i in GlobalVariable.checkUpgrades{  //check if upgrades have been used
            if i == true{
                buttonArray[counter]!.isHidden=true  //hide all upgrades that have been used
            }
            counter = counter + 1
        }

        initiateTimer()  //start checking the timer to see if bankLabel needs to be updated
            //print("The timer exists!!!!!!")
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool){ //function that gets called when the view disappears
        littleTimer.invalidate()
        
        //print("MVC vanished!")
    }
    
//variables

    
    
    
    
    
//show only the unused upgrade buttons
    func showUpgrades(ar: Array<Any>){
        //the code I wanted her is in viewDidLoad, it throws errors when moved here
            }
    
    
    
//bank label
    @IBOutlet weak var bankLabel: UILabel!
    
    
//first upgrade - double click power
    @IBAction func up1(_ sender: AnyObject) {
        if (GlobalVariable.tempBank>=100){ //if you have enough to buy the upgrade
            GlobalVariable.tempBank = GlobalVariable.tempBank - 100 //pay the cost
            ViewController.GlobalVariable.clickMultiplier = ViewController.GlobalVariable.clickMultiplier*2//update multiplier
            upd8Banks()  //fix what the bank is displaying
            toggleUp1.isHidden = true  //hide button
            GlobalVariable.checkUpgrades[0]=true //update checkUpgrades to show that upgrade has been used
        }
    }
    @IBOutlet weak var toggleUp1: UIButton!
    
//second upgrade - free coin every 10 seconds
    @IBAction func up2(_ sender: AnyObject) {
//when the upgrade is bought, start the timer
        if (GlobalVariable.tempBank>=250){ //if you have enough to buy the upgrade
            GlobalVariable.tempBank = GlobalVariable.tempBank - 250 //pay the cost
            ViewController.GlobalVariable.initiateTimer() //initiate idle part of the game
            upd8Banks()  //fix what the bank is displaying
            toggleUp2.isHidden = true  //hide button
            GlobalVariable.checkUpgrades[1]=true //update checkUpgrades to show that upgrade has been used
        }
    }
    @IBOutlet weak var toggleUp2: UIButton!
    
//third upgrade- click power +1
    @IBAction func up3(_ sender: AnyObject) {
        if (GlobalVariable.tempBank>=500){ //if you have enough to buy the upgrade
            GlobalVariable.tempBank = GlobalVariable.tempBank - 500 //pay the cost
            ViewController.GlobalVariable.clickMultiplier = ViewController.GlobalVariable.clickMultiplier+1//update multiplier
            upd8Banks()  //fix what the bank is displaying
            toggleUp3.isHidden = true  //hide button
            GlobalVariable.checkUpgrades[2]=true //update checkUpgrades to show that upgrade has been used
        }
    }
    @IBOutlet weak var toggleUp3: UIButton!
    
    
//fourth upgrade
    @IBAction func up4(_ sender: AnyObject) {
        //when the upgrade is bought, start the timer
        if (GlobalVariable.tempBank>=500){ //if you have enough to buy the upgrade
            GlobalVariable.tempBank = GlobalVariable.tempBank - 500 //pay the cost
            ViewController.GlobalVariable.initiateTimer2() //initiate idle part of the game
            upd8Banks()  //fix what the bank is displaying
            toggleUp4.isHidden = true  //hide button
            GlobalVariable.checkUpgrades[3]=true //update checkUpgrades to show that upgrade has been used
        }
    }
    @IBOutlet weak var toggleUp4: UIButton!
    
    
    
//update the tempBank and real bank, amounts and labels
    func upd8Banks(){
        bankLabel.text = "Bank: \(GlobalVariable.tempBank)"  //update text

    }
    
 
//check safeStore once per second and update bankLabel if needed
    var littleTimer = Timer()
    var timeCounter = 0
    var checker = 0
    
    func initiateTimer(){
        littleTimer = Timer.scheduledTimer(timeInterval: 1, target:self, /*selector: Selector("checkTimer")*/selector: #selector(checkTimer), userInfo: nil, repeats: true)
    }

    
    func checkTimer() {
        //timeCounter =  timeCounter + 1  //increment the counter
        if ViewController.GlobalVariable.safeStore>checker/*ViewController.GlobalVariable.safeStore>0*/{
            GlobalVariable.tempBank = GlobalVariable.tempBank + 1
            upd8Banks()
            checker = ViewController.GlobalVariable.safeStore
        }
        //print(GlobalVariable.tempBank)
        
    }

    
    
    
    
    
//update Game State
    func gameState(){
        //I'm not sure exactly what I made this for.  I will do something with it later.  probably.
    }

    

    
    
//Global Variables
    struct GlobalVariable{
        //static var myString = String()
        static var checkUpgrades: Array<Bool>=[false,false,false,false]
        static var tempBank = 0
        
   //timer variables
        
        
        //static var debugNum = 0

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
