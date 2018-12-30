//
//  ViewController.swift
//  OTPTextView
//
//  Created by ehsanomid on 12/29/2018.
//  Copyright (c) 2018 ehsanomid. All rights reserved.
// // GitHub : https://github.com/ehsanomid  Email : imehsan@icloud.com

import UIKit
import OTPTextView
class ViewController: UIViewController,OTPTextViewDelegate {
    
    func OTPTextViewResult(number: String?) {
        
  
        if number != nil
        {
            let alert = UIAlertController(title: "Alert", message: number, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var OTPTextVU: OTPTextView!
    @IBOutlet weak var placeHolder: UITextField!
    @IBOutlet weak var clearAllButton: UIButton!
    @IBOutlet weak var showNumberButton: UIButton!
    @IBAction func slider(_ sender: UISlider) {
        
        OTPTextVU.gape = CGFloat(sender.value)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        OTPTextVU.BlocksNo = Int(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OTPTextVU.layer.cornerRadius = 10
        OTPTextVU.delegate = self
        
        OTPTextVU.indicatorStyle = .underline
        
        clearAllButton.StyleTheButton()
        showNumberButton.StyleTheButton()
        
        
        /*

         let myOTPTextView = OTPTextView(frame:CGRect(x: 10, y: 400, width: 300, height: 50))
        view.addSubview(myOTPTextView)
        print(myOTPTextView.getNumber())
 
        */
        
    }
    
    @IBAction func showCursor(_ sender: UISwitch) {
        
        
        OTPTextVU.showCursor = sender.isOn
    }
    @IBAction func forceToFill(_ sender: UISwitch) {
        
        OTPTextVU.forceCompletion = sender.isOn
        
    }
    @IBAction func middleGape(_ sender: UISwitch) {
        
        if sender.isOn
        {
            OTPTextVU.MiddleGapeToggle(with: 10)
        } else
        {
            OTPTextVU.MiddleGapeToggle(with: -10)
        }
        
        
    }
    @IBAction func AutomaticDone(_ sender: UISwitch) {
        
        OTPTextVU.callOnCompleted = sender.isOn
        
    }
    
    @IBAction func showBorder(_ sender: UISwitch) {
        
        if !sender.isOn
        {
            OTPTextVU.isBorderHidden = true
            
        } else
        {
            OTPTextVU.isBorderHidden = false
            
        }
        
        
    }
    @IBAction func showIndicator(_ sender: UISwitch) {
        
        if sender.isOn
        {
            OTPTextVU.underLineIndicator.isHidden = false
            
        } else
        {
            OTPTextVU.underLineIndicator.isHidden = true
            
        }
    }
    @IBAction func autoArrange(_ sender: UISwitch) {
        
        
        OTPTextVU.AutoArrange = sender.isOn
    }
}

extension UIView {
    func StyleTheButton()
    {
        self.backgroundColor = .clear //UIColor(red:202.0/255.0, green:228.0/255.0, blue:230.0/255.0, alpha:1.0)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:202.0/255.0, green:220.0/255.0, blue:230.0/255.0, alpha:1.0).cgColor
    }
}
