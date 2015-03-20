//
//  BarsNearbyView.swift
//  DJ App
//
//  Created by Ryan Gates on 3/8/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit

class BarsNearbyView: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    //color scheme = black background and blue text
    @IBOutlet
    var tableView: UITableView!
    var items : [String]  = ["Kam's", "Murphy's", "Brothers", "Red Lion", "Firehaus"]

    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor.darkGrayColor()
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        var locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        //cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(18.0)
        cell.backgroundColor = UIColor.darkGrayColor()
        cell.textLabel?.textColor = UIColor(red: 5.0/255.0, green: 208.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("BarsNearby", sender: self)
    }
    
    func locationManger(manager: CLLocationManager){
        
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView){
        self.performSegueWithIdentifier("MainScreen", sender : self)
        
    }
    
    
}
