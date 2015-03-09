//
//  BarsNearbyView.swift
//  DJ App
//
//  Created by Ryan Gates on 3/8/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit

class BarsNearbyView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet
    var tableView: UITableView!
    var items : [String]  = ["Kam's", "Murphy's", "Brothers", "Red Lion", "Firehaus"]

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    

    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("BarsNearby", sender: self)
    }
    
}
