//
//  BarsNearbyView.swift
//  DJ App
//
//  Created by Ryan Gates on 3/8/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit
import CoreLocation

class BarsNearbyView: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var tableView: UITableView!
    var items2 : [String]  = ["Kam's", "Murphy's", "Brothers", "Red Lion", "Firehaus"]
    var items = [String]()
    var barName : String!
    var barLocation : [String : CLLocation!] = [ //dictionary of all campus bars and their coordinates
        "Kam's" : CLLocation(latitude:40.1079598, longitude:-88.2276094),
        "Brothers": CLLocation(latitude:40.110126, longitude:-88.229688),
        "Joe's" : CLLocation(latitude:40.1103156, longitude:-88.2349688),
        "Legends": CLLocation(latitude:40.1099865, longitude:-88.2296344),
        "The Clybourne": CLLocation(latitude:40.1099865, longitude:-88.2296344),
        "The Red Lion": CLLocation(latitude:40.1103156, longitude:-88.2349688),
        "Murphy's": CLLocation(latitude:40.110492, longitude:-88.230168),
        "Firehaus": CLLocation(latitude:40.109680, longitude:-88.230264),
        "White Horse Inn": CLLocation(latitude:40.109245, longitude:-88.230881)]
    
    var locationManager : CLLocationManager!
    var location : CLLocation!
    
    var distanceIndicator = [UILabel]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "abstract-blurred-lines-colorful-370.jpeg")!)

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //var initLocation = CLLocation(latitude: 40.1079598, longitude: -88.2276094)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        
        //println("Called and \(locations[locations.count-1])")
        var distanceString : String
        var distance : Double
        var spacesToAdd : Int
        
        for (bar,barLoc) in barLocation {
            
            //println("Bar:\(bar)")
            distance = locationManager.location.distanceFromLocation(barLoc)
            //println("Distance:\(locationManager.location.distanceFromLocation(barLoc))")
            
            if distance < 2000{
                distanceString = String(format: "%.2f mi away", (distance/1000.0)*0.621371) //converts km to mi and formats
                var label = UILabel()
                label.text = distanceString
                items.append(bar)
                distanceIndicator.append(label)
                self.tableView.reloadData()
            }
            else if locationManager.location.distanceFromLocation(barLoc) > 2000{
                for var i = 0; i < items.count; i+=1{
                    if items[i] == "bar"{
                        self.tableView.beginUpdates()
                        items.removeAtIndex(i)
                        //self.tableView.deleteRowsAtIndexPaths(items[i], withRowAnimation: UITableViewRowAnimation.Fade)
                    }
                }
                self.tableView.endUpdates()
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject?) {
        if (segue.identifier == "BarsNearby") {
            var svc = segue!.destinationViewController as MainMenuView;
            
            svc.barSelected = barName
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        cell.addSubview(distanceIndicator[indexPath.row])
        distanceIndicator[indexPath.row].frame = CGRectMake(240.0, 5.0, 115.0, 30.0)
        distanceIndicator[indexPath.row].textColor = UIColor(red: 5.0/255.0, green: 208.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        //cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(18.0)
        //cell.backgroundColor = UIColor.darkGrayColor()
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor(red: 5.0/255.0, green: 208.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        barName = items[indexPath.row]
        self.performSegueWithIdentifier("BarsNearby", sender: self)
    }
    
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView){
        self.performSegueWithIdentifier("MainScreen", sender : self)
        
    }
    
    
}