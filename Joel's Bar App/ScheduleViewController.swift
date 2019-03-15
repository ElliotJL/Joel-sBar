//
//  ScheduleViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 26/02/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {

    let scheduleCellId = "scheduleCellId"
    let days = ["Sunday 7th April", "Monday 8th April", "Tuesday 9th April", "Wednesday 10th April",
                "Thursday 11th April", "Friday 12th April"]
    let monday = [["08:00", "Breakfast", "Canteen"],
                  ["09:00", "Morning Session", "Bar"],
                  ["10:00", "Praise and Worship", "Bar"],
                  ["12:00", "Lunch", "Canteen"],
                  ["14:00", "Afternoon Session", "Various"],
                  ["17:00", "Dinner", "Canteen"],
                  ["19:00", "Evening Session", "Bar"],
                  ["21:00", "Praise and Worship", "Bar"]]
    let mondayActivities =
        [["Example Activity 1", "Example Leader", "Example Location", "1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."],
        ["Example Activity 2", "Example Leader", "Example Location", "2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."],
        ["Example Activity 3", "Example Leader", "Example Location", "3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFrame()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: scheduleCellId)
        tableView.tableFooterView = UIView()
    }
    
    func setFrame() {
        let imageView = UIImageView(image: UIImage(named: "jblogoblack"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 52, height: 40)
        navigationItem.titleView = imageView
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: scheduleCellId, for: indexPath)
        cell.textLabel?.text = days[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Futura", size: 20)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dailyViewController = DailyViewController()
        dailyViewController.day = monday
        dailyViewController.activity = mondayActivities
        dailyViewController.pageTitle = days[indexPath.row]
        navigationController?.pushViewController(dailyViewController, animated: true)
    }

}
