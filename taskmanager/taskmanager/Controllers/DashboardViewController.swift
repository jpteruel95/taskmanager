//
//  DashboardViewController.swift
//  taskmanager
//
//  Created by John Patrick Teruel on 14/10/2017.
//  Copyright © 2017 Hoshizora. All rights reserved.
//

import UIKit
import CoreData

class DashboardViewController: UIViewController {
    @IBOutlet weak var dashboardTableView: UITableView!
    var tasks: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dashboardTableView.register(UINib(nibName: "SectionView", bundle: nil), forHeaderFooterViewReuseIdentifier: "SectionView")
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource{
    
    //UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return tasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionView") as! SectionView
        
        if(section == 1){
            sectionView.sectionLabel.text = "Upcoming Tasks"
        }
        
        return sectionView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 60.0
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        var cell = UITableViewCell()
        
        if(indexPath.section == 0){ //Current task cell
            cellIdentifier = "currentTaskCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            
            if let cTaskLabel = cell.viewWithTag(1001) as? UILabel{
                cTaskLabel.text = "WHS Monitor iOS"
            }
            if let cDStartLabel = cell.viewWithTag(1002) as? UILabel{
                cDStartLabel.text = "October 14, 2017 11:22 AM"
            }
            if let cDlineLabel = cell.viewWithTag(1003) as? UILabel{
                cDlineLabel.text = "October 20, 2017 6:00 PM"
            }
            
        }else{
            cellIdentifier = "upcomingTaskCell"
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        }
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
