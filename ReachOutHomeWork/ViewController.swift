//
//  ViewController.swift
//  ReachOutHomeWork
//
//  Created by Alvin George on 11/29/16.
//  Copyright © 2016 Alvin George. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var workOrderDetailTableView: UITableView!

    //CustomCells
    var totalNumberOfRows:Int?
    var CellIdentifier: String = ""
    var cell:UITableViewCell?
    var tjsonstring : String!
    var isFormDownload:Bool = false
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    var selectedIndexpath =   NSIndexPath(forRow: 0, inSection: 0)
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    //MARK:- TableView DataSource and Delegate

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        self.workOrderDetailTableView.estimatedRowHeight = 400.0


        if(indexPath.section == 0)
        {
            self.workOrderDetailTableView.rowHeight = 80
        }

        if(indexPath.section == 1)
        {
            self.workOrderDetailTableView.rowHeight = UITableViewAutomaticDimension
        }
        else if (indexPath.section == 2 ){
            //contact title cell
            self.workOrderDetailTableView.rowHeight =  35
        }
        else if (indexPath.section == 3 ){
            //contact list cell
            self.workOrderDetailTableView.rowHeight =  22
        }
        else if (indexPath.section == 4 ){
            //organization Title Cell
            self.workOrderDetailTableView.rowHeight =  50
        }
        else if (indexPath.section == 5 ){
            //organization Title Cell
            self.workOrderDetailTableView.rowHeight =  180
        }

        else{
            //self.workOrderDetailTableView.rowHeight =  UITableViewAutomaticDimension
        }
        return self.workOrderDetailTableView.rowHeight
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 6

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(section == 0){
            self.totalNumberOfRows = 1
        }
        if(section == 1){
            self.totalNumberOfRows = 1
        }
        if(section == 2){
            self.totalNumberOfRows = 1
        }
        if(section == 3){
            self.totalNumberOfRows = 1
        }
        if(section == 4){
            self.totalNumberOfRows = 4
        }
        if(section == 5){
            self.totalNumberOfRows = 1
        }
        if(section == 5){
            self.totalNumberOfRows = 1
        }

        return self.totalNumberOfRows!
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if (indexPath.section == 0)
        {
            CellIdentifier = "workOrderDetailCell"

            var cell :WorkOrderDetailCell
            cell =  tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! WorkOrderDetailCell
            cell.workOrdersubTitleLabel.text = "Electrical Maintenance and Repair"
            cell.workOrdersubTitleLabel.sizeToFit()

            cell.workOrderStatuslabel.layer.masksToBounds = true
            cell.workOrderStatuslabel.sizeToFit()
            cell.workOrderStatuslabel.layer.cornerRadius =  5.0
            return cell
        }
        else if(indexPath.section == 1)
        {

            CellIdentifier = "workOrderMapTableCell"

            var cell: WorkOrderMapTableViewCell
            cell =  tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! WorkOrderMapTableViewCell
            cell.locationDistanceLabel.text = "Distance not available"

            cell.workOrderDetailMapView.frame.size.height = UIScreen.mainScreen().bounds.size.height/2.5
            // cell.mapViewHeightConstraint.constant = UIScreen.mainScreen().bounds.size.height/2.5

            return cell
        }
        else if(indexPath.section == 2)
        {

            CellIdentifier = "workOrderOraganizationTitleCell"

            var cell :WorkOrderOrganizationTitleCell
            cell =  tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! WorkOrderOrganizationTitleCell
            return cell

        }
        else if(indexPath.section == 3)
        {

            CellIdentifier = "workOrderContactTitleCellID"

            var cell: WorkOrderContactTitleCell
            cell =  tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! WorkOrderContactTitleCell

            return cell

        }
        else if (indexPath.section == 4)
        {

            CellIdentifier = "workOrderContactTableCell"

            var cell :WorkOrderContactTableViewCell
            cell =  tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! WorkOrderContactTableViewCell
            cell.contactNameLabel.text = "John James"
            cell.contactCallButton?.layer.setValue(indexPath, forKey: "index")
            cell.messageButton?.layer.setValue(indexPath, forKey: "index")

            return cell

        }
        else if (indexPath.section == 5)
        {
            CellIdentifier = "workOrderDateCell"

            var cell :WorkOrderDateCell
            cell =  tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! WorkOrderDateCell

            return cell
        }

        else {

            let cell: UITableViewCell = UITableViewCell()
            return cell
        }

    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    @IBAction func downloadInstructionsClicked(sender: AnyObject) {

        self.performSegueWithIdentifier("segueToSecondVC", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

