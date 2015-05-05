//
//  SongRequestView.swift
//  DJ App
//
//  Created by Ryan Gates on 4/26/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//
import UIKit
class SongRequestView : UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet var artistField: UITextField!
    @IBOutlet var requestButton: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var view1: UIView!
    

    var songName : String!
    var artistName : String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view1.backgroundColor = UIColor(patternImage: UIImage(named: "abstract-blurred-lines-colorful-370.jpeg")!)
        requestButton.layer.cornerRadius = 5;
        requestButton.layer.borderWidth = 0;
        
    }
    
    func textFieldDidEndEditing(textField : UITextField){

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject?) {
        if (segue.identifier == "toQueue") {
            var svc = segue!.destinationViewController as QueueView
            var svc2 = segue!.destinationViewController as QueueView
            
            svc.requestedSongName = songName
            svc2.requestedArtistName = artistName
        }
    }
    
    @IBAction func handleButtonClick(sender: AnyObject) {
        if (!nameField.text.isEmpty && !artistField.text.isEmpty){
            songName = nameField.text
            artistName = artistField.text
            self.performSegueWithIdentifier("toQueue", sender: self)
        }
    }
    //@dynamic overlayButton
    
    //func
}
