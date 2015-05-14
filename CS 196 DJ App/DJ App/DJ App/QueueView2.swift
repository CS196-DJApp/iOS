//
//  QueueView2.swift
//  DJ App
//
//  Created by Ryan Gates on 5/5/15.
//  Copyright (c) 2015 Ryan Gates. All rights reserved.
//

import UIKit

class QueueView2 : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var songs = ["Darude - Sandstorm", "Avicii - Levels", "Black Eyed Peas - I Gotta Feeling", "Taio Cruz - Dynamite" ]
    var requestedSongName : String!
    var requestedArtistName : String!
    var viewLoadedOnce = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if (requestedSongName != nil && requestedArtistName != nil){
            songs.append(requestedArtistName + "-" + requestedSongName)
            
        }
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "abstract-blurred-lines-colorful-370.jpeg")!)
        
        songs.append("Rick Astley - Never Gonna Give You Up")
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as TableViewCell
        
        cell.titleLabel.text = self.songs[indexPath.row]
        cell.upvoteButton.tag = indexPath.row
        cell.upvoteButton.addTarget(self, action:"upAction:", forControlEvents: .TouchUpInside)
        cell.songScore.text = String(cell.songUps)
        
        cell.downvoteButton.tag = indexPath.row
        cell.downvoteButton.addTarget(self, action:"downAction:", forControlEvents: .TouchUpInside)
        
        if (cell.titleLabel.text == "Rick Astley - Never Gonna Give You Up"){
            cell.songUps = -4
            cell.songScore.text = "-4"
        }
        
        cell.contentView.backgroundColor = UIColor.clearColor()
        cell.backgroundView?.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
 
        return cell
    }
    
    @IBAction func upAction(sender: UIButton){
        let titleString = self.songs[sender.tag]
        var clickedCell = sender.superview?.superview as TableViewCell
        var indexPath = self.tableView.indexPathForCell(clickedCell)
        
        if (clickedCell.votedOn == false){
            clickedCell.songUps++
        
            self.tableView.reloadData()
            clickedCell.votedOn = true

        }
        //var clickedCell = tableView.cellForRowAtIndexPath(sender.tag)
        
    }
    
    @IBAction func downAction(sender : UIButton){
        var clickedCell = sender.superview?.superview as TableViewCell
        var indexPath = self.tableView.indexPathForCell(clickedCell)?.row
        
        if (clickedCell.votedOn == false){
            clickedCell.songUps--
            clickedCell.votedOn = true
            self.tableView.reloadData()


        }
        if (clickedCell.songUps <= -5){
            songs.removeAtIndex(indexPath!)
            self.tableView.reloadData()
        }
    }
    
}

