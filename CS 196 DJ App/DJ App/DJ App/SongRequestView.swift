//
//  SongRequestView.swift
//  DJ App
//
//  Created by Ryan Gates on 4/26/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//
import UIKit
class SongRequestView : UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet var requestField: UITextField!
    var song : String!
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    func textFieldDidEndEditing(textField : UITextField){
        song = textField.text
        println(song)
    }
    
    //@dynamic overlayButton
    
    //func
}
