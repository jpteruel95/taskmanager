//
//  MenuTableViewController.swift
//  taskmanager
//
//  Created by John Patrick Teruel on 14/10/2017.
//  Copyright © 2017 Hoshizora. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var menuItems: Array<String>! = []
    
    enum MenuItems{ //keep this practice
        case DashboardIndex,
        TasksIndex,
        AboutIndex,
        NUM_MENU_ITEMS //total number of items in menu
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = [String](repeating: "", count: val(.NUM_MENU_ITEMS)) //declare size
        menuItems[val(.DashboardIndex)] = "Dashboard" //assigns menu item name to menu item index (duh)
        menuItems[val(.TasksIndex)] = "Tasks"
        menuItems[val(.AboutIndex)] = "About"
        
        let indexPath = IndexPath(row: val(.DashboardIndex), section: 0) //default selection
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none) //execute selection

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell", for: indexPath)
        let menuItem = menuItems[indexPath.row];
        if let cellLabel = cell.viewWithTag(1001) as? UILabel{
            cellLabel.text = menuItem;
        }
        
        if(indexPath.row == 0){
//            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
        }
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuStr = menuItems[indexPath.row];
        print("Did select \(menuStr)")
        self.switchVC(indexPath.row)
        if(indexPath.row == val(.DashboardIndex)){
            //Dashboard here
        
        }else if(indexPath.row == val(.TasksIndex)){
            //Tasks here
            
        }else if(indexPath.row == val(.AboutIndex)){
            //About Index Here
            
        }
    }
    
    func val(_ menuItem: MenuItems) -> Int{
        return menuItem.hashValue;
    }
    
    func switchVC(_ menuItem: Int){
        let navController = self.navigationController
        
        let splitScreen = navController?.parent
        let dNavController = splitScreen?.childViewControllers[1] as? UINavigationController
        
        if(menuItem == val(.DashboardIndex)){
            dNavController!.performSegue(withIdentifier: "DashboardViewControllerSegue", sender: self)
        }else if(menuItem == val(.TasksIndex)){
            dNavController!.performSegue(withIdentifier: "TasksViewControllerSegue", sender: self)
        }else if(menuItem == val(.AboutIndex)){
            
        }
        
    }

    func printClass(_ obj: AnyObject) -> String{
        return NSStringFromClass(obj.classForCoder)
    }
}
