//
//  ViewController.swift
//  UserNotifications
//
//  Created by Maciej Krolikowski on 09/02/15.
//  Copyright (c) 2015 Maciej Krolikowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "drawRectangle:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMessage:", name: "actionTwoPressed", object: nil)
        
        var dateCamp:NSDateComponents = NSDateComponents()
        dateCamp.year = 2015
        dateCamp.month = 02
        dateCamp.day = 10
        dateCamp.hour = 00
        dateCamp.minute = 42
        dateCamp.timeZone = NSTimeZone.systemTimeZone()
        
        var calendar:NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        var date:NSDate = calendar.dateFromComponents(dateCamp)!
        
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "My first notification"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func drawRectangle(notofication: NSNotification) {
        let rectangle = UIView(frame: CGRectMake(0, 0, 50, 50))
        rectangle.backgroundColor = UIColor.greenColor()
        self.view.addSubview(rectangle)
    }
    
    func showMessage(notification:NSNotification) {
        let alertController = UIAlertController(title: "Hey jow", message: "jowjow", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

