//
//  ViewController.swift
//  infiniteScrollTest
//
//  Created by Sean Calkins on 8/8/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
   
    var dataSource = ["1","2","3","4","5","6","7","8","9","10"]
    var screenHeight = UIScreen.mainScreen().bounds.size.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        
//        
//        for i in 1...10 {
//            
//            dataSource.append("\(i)")
//            
//            print(i)
//            
//        }
        
        self.tableView.backgroundColor = .clearColor()
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let data = dataSource[indexPath.row]
        
        print("Here it is! \(data)")
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = dataSource[indexPath.row]
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Loop Cell", forIndexPath: indexPath) as! LoopTableViewCell
        
        cell.spaceFaceImageView.image = nil
        
        let rectOfCellInTableView: CGRect = tableView.rectForRowAtIndexPath(indexPath)
        let rectOfCellInSuperview: CGRect = tableView.convertRect(rectOfCellInTableView, toView: tableView.superview)
        
        cell.spaceFaceImageView.image = UIImage(named: data)
        
        self.changeImageSize(rectOfCellInSuperview.origin.y)
       
        cell.imageHeightConstraint.constant = self.changeImageSize(rectOfCellInSuperview.origin.y)
        cell.imageWidthConstraint.constant = self.changeImageSize(rectOfCellInSuperview.origin.y)
        cell.horizontalConstraint.constant = self.moveConstraint(rectOfCellInSuperview.origin.y)
        
        cell.backgroundColor = .clearColor()

        return cell
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 150
        
    }
    
    func changeImageSize(y: CGFloat) -> CGFloat {
        
        
        var yDistanceFromCenter = (y - (screenHeight/2))
        
        if yDistanceFromCenter < 0 {
            
            yDistanceFromCenter = yDistanceFromCenter * -1
            
        }

        let newFloat = 100 - ((yDistanceFromCenter * yDistanceFromCenter)  / 1500)
       
        return newFloat
        
    }
    
    func moveConstraint(y: CGFloat) -> CGFloat {
        
        // between 1 and 300
        
       // print(screenHeight/2)
        
        var yDistanceFromCenter = (y - (screenHeight/2))
        
        if yDistanceFromCenter < 0 {
            
            yDistanceFromCenter = yDistanceFromCenter * -1
            
        }
        
        // cell distance from screen center
//        print(yDistanceFromCenter)
       
        return ((yDistanceFromCenter * yDistanceFromCenter) / 400) + 50
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        self.tableView.reloadData()
       
        let actualPosition: CGFloat = scrollView.contentOffset.y
        let contentHeight: CGFloat = scrollView.contentSize.height - 1000
       
      //  print(actualPosition)
      //  print(contentHeight)
        
        if (actualPosition >= contentHeight) {
            
            self.dataSource += self.dataSource
            
            self.tableView.reloadData()
            
        }
        
        
    }
    
    
}

