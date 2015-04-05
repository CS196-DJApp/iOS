//
//  QueueView.swift
//  DJ App
//
//  Created by Ryan Gates on 3/22/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import Foundation
import UIKit

class QueueView : UITableViewController, UITableViewDataSource, UITableViewDelegate {
    var up  = UIButton()
    var down = UIButton()
    var songs = ["Darude - Sandstorm", "Avicii - Levels", "Black Eyed Peas - I Gotta Feeling", "Taio Cruz - Dynamite" ]
    
    func refresh(sender: AnyObject){
        
        tableView.reloadData()
        
        //These 3 lines set text and color for the refresh animation. Last line has refresh animation last for one second (just to
        // see what text looks like for the time being).
        var attributes = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing...", attributes: attributes)
        NSThread.sleepForTimeInterval(1.0)
        
        self.refreshControl?.endRefreshing()
    }
    
    override func viewDidLoad(){
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.darkGrayColor()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        //Instantiates refresh control object and setts color to be same color as table
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.backgroundColor = UIColor.darkGrayColor()
        self.refreshControl?.tintColor = UIColor.whiteColor()
        
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(self.refreshControl!)
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.songs[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.darkGrayColor()
        
        up.setTitle("Up", forState: UIControlState.Normal)
        //up.setBackgroundImage(UIImage(named: "UnselectedUpvote.png"), forState: UIControlState.Normal)
        down.setTitle("Down", forState: UIControlState.Normal)
        up.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        down.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        up.frame = CGRectMake(200.0, 5.0, 75.0, 30.0)
        down.frame = CGRectMake(250.0, 5.0, 75.0, 30.0)
        
        cell.contentView.addSubview(up)
        cell.contentView.addSubview(down)
        return cell
    }
    
    func getNewestRequests() -> String {
        return ""
    }
    

}