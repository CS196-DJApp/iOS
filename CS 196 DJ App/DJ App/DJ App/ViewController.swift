//
//  ViewController.swift
//  DJ App
//
//  Created by Ryan Gates on 2/20/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginView: FBLoginView = FBLoginView()
        loginView.center = self.view.center
        self.view.addSubview(loginView)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

