//
//  ViewController.swift
//  MyNotes
//
//  Created by Thomas.Tay.sg on 23/2/16.
//  Copyright © 2016 Thomas.Tay.sg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myTextViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: Default Template
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Notification
    @objc func keyboardShow(_ notification: Notification) {
        
        let userInfo = notification.userInfo!
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
        
        myTextViewBottomConstraint.constant = (keyboardFrame?.size.height)!
    }
    
    @objc func keyboardHide(_ notification: Notification) {
        
        myTextViewBottomConstraint.constant = 0
        
    }
    
    
    // MARK: IBAction

    @IBAction func hideKB(_ sender: UIBarButtonItem) {
        
        myTextView.resignFirstResponder()
        
    }
    
    

}

