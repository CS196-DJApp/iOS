//
//  MainMenuView.swift
//  DJ App
//
//  Created by Ryan Gates on 3/19/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit

class MainMenuView: UIViewController {
    
    @IBOutlet var viewQueue: UIButton!
    @IBOutlet var specialRequests: UIButton!
    @IBOutlet var order: UIButton!
    @IBOutlet var djs: UIButton!
    @IBOutlet var requestSong: UIButton!
    @IBOutlet var currentSongLabel : UILabel!
    var barSelected : String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "abstract-blurred-lines-colorful-370.jpeg")!)
        
        self.viewQueue.layer.borderWidth = 2.0
        self.viewQueue.layer.borderColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        //self.viewQueue.layer.backgroundColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        self.viewQueue.layer.cornerRadius = 10
        self.viewQueue.clipsToBounds = true
        
        self.specialRequests.layer.borderWidth = 2.0
        self.specialRequests.layer.borderColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        //self.specialRequests.layer.backgroundColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        self.specialRequests.layer.cornerRadius = 10
        self.specialRequests.clipsToBounds = true


        
        self.order.layer.borderWidth = 2.0
        self.order.layer.borderColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        //self.order.layer.backgroundColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        self.order.layer.cornerRadius = 10
        self.order.clipsToBounds = true

        
        self.djs.layer.borderWidth = 2.0
        self.djs.layer.borderColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        //self.djs.layer.backgroundColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        self.djs.layer.cornerRadius = 10
        self.djs.clipsToBounds = true

        
        self.requestSong.layer.borderWidth = 2.0
        self.requestSong.layer.borderColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        //self.requestSong.layer.backgroundColor = UIColor(red: 127, green: 127, blue: 127, alpha: 0.5).CGColor
        self.requestSong.layer.cornerRadius = 10
        self.requestSong.clipsToBounds = true

        currentSongLabel.text = barSelected
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}