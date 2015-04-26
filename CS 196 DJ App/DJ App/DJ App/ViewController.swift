//
//  ViewController.swift
//  DJ App
//
//  Created by Ryan Gates on 2/20/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet var fbLoginView : FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "abstract-blurred-lines-colorful-370.jpeg")!)
        // Do any additional setup after loading the view, typically from a nib.
        
//        let loginView: FBLoginView = FBLoginView() 
//        loginView.center = self.view.center
//        self.view.addSubview(loginView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        self.performSegueWithIdentifier("BarsNearby", sender: self)
    }
    


}

