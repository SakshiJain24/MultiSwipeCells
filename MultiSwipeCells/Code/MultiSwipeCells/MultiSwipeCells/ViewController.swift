//
//  ViewController.swift
//  MultiSwipeCells
//
//  Created by Sakshi Jain on 19/04/16.
//  Copyright (c) 2016 Sakshi Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.separatorInset = UIEdgeInsetsZero

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5    
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : MGSwipeTableCell = tableView.dequeueReusableCellWithIdentifier("MGSwipeTableViewCell", forIndexPath: indexPath) as! MGSwipeTableCell
        
        if cell.isEqual(nil)
        {
            cell = MGSwipeTableCell(style: UITableViewCellStyle.Default,
                reuseIdentifier: "MGSwipeTableViewCell")
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        }
        
        cell.leftSwipeSettings.transition = MGSwipeTransition.Drag;
        cell.rightSwipeSettings.transition = MGSwipeTransition.Drag;
        cell.leftExpansion.buttonIndex = 0;
        cell.leftExpansion.fillOnTrigger = false
        cell.rightExpansion.buttonIndex = 0;
        cell.rightExpansion.fillOnTrigger = false
        cell.leftButtons = self.createLeftButton() as [AnyObject]
        cell.rightButtons = self.createRightButton() as [AnyObject]
        
        
        return cell
    }
    
    func createLeftButton () -> NSArray
    {
        var result : NSMutableArray = NSMutableArray()
        
        var button : MGSwipeButton = MGSwipeButton(title: "Delete", backgroundColor: UIColor.cyanColor())
        
        /*
            Use CallBack Methods of MGSwipeButton class to perform some action
        */
        
        button.buttonWidth = 90
        button.buttonHeight = 121
        
        result.addObject(button)
        
        return result;
    }
    
    func createRightButton () -> NSArray
    {
        var result : NSMutableArray = NSMutableArray()
        
        var button : MGSwipeButton = MGSwipeButton(title: "Edit", backgroundColor: UIColor.blueColor())

        /*
        Use CallBack Methods of MGSwipeButton class to perform some action
        */
        button.buttonHeight = 105
        button.buttonWidth = 90
        
        result.addObject(button)
        
        return result;
    }
}