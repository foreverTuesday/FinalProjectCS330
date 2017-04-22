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
        
        var buttonArray = [toggleUp1,toggleUp2] //create button outlet array
        showUpgrades(ar: buttonArray)
    // Do any additional setup after loading the view.

    //print("I got to viewDidLoad in MenuViewController")
    
        GlobalVariable.tempBank = ViewController.GlobalVariable.inBank //put the right number into tempBank
        bankLabel.text = "Bank: \(GlobalVariable.tempBank)"  //display the right number in bankLabel

        for i in GlobalVariable.checkUpgrades{  //check if upgrades have been used
            var counter = 0
            if i == true{
                buttonArray[counter]?.isHidden=i  //hide all upgrades that have been used
            }
            counter = counter + 1
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//variables

    
    
    
    
    
//show only the unused upgrade buttons
    func showUpgrades(ar: Array<Any>){
            }
    
    
    
//bank label
    @IBOutlet weak var bankLabel: UILabel!
    
    
//first upgrade - double click power
    @IBAction func up1(_ sender: AnyObject) {
        if (GlobalVariable.tempBank>=10){ //if you have enough to buy the upgrade
            GlobalVariable.tempBank = GlobalVariable.tempBank - 10 //pay the cost
            ViewController.GlobalVariable.clickMultiplier = ViewController.GlobalVariable.clickMultiplier*2//update multiplier
            upd8Banks()  //fix what the bank is displaying
            toggleUp1.isHidden = true  //hide button
            GlobalVariable.checkUpgrades[0]=true //update checkUpgrades to show that upgrade has been used
        }
    }
    @IBOutlet weak var toggleUp1: UIButton!
    
//second upgrade -
    @IBAction func up2(_ sender: AnyObject) {
//when the upgrade is bought, start the timer
        ViewController.GlobalVariable.initiateTimer() //initiate idle part of the game
        
        
        toggleUp2.isHidden = true  //hide button
        GlobalVariable.checkUpgrades[1]=true //update checkUpgrades to show that upgrade has been used
    }
    @IBOutlet weak var toggleUp2: UIButton!
    
    
//update the tempBank and real bank, amounts and labels
    func upd8Banks(){
        bankLabel.text = "Bank: \(GlobalVariable.tempBank)"  //update text

    }
    
    
//update Game State
    func gameState(){
        //I'm not sure exactly what I made this for.  I will do something with it later.  probably.
    }

    

    
    
//Global Variables
    struct GlobalVariable{
        //static var myString = String()
        static var checkUpgrades: Array<Bool>=[false,false]
        static var tempBank = Int()
        
   //timer variables
        
        
        static var debugNum = 0

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
