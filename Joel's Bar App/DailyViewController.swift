//
//  DailyViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 01/03/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class DailyViewController: UITableViewController {
    
    var day: [[String]]?
    var activity: [[String]]?
    var pageTitle: String?
    let dayCellId = "dayCellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        setFrame()
        
        tableView.register(DayCell.self, forCellReuseIdentifier: dayCellId)
        tableView.tableFooterView = UIView()
    }
    
    func setFrame() {
        navigationItem.title = pageTitle
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dayCount = day?.count {
            return dayCount
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dayCellId, for: indexPath) as! DayCell
        cell.timeLabel.text = day?[indexPath.row][0]
        cell.titleLabel.text = day?[indexPath.row][1]
        cell.locationLabel.text = day?[indexPath.row][2]
        cell.isUserInteractionEnabled = false
        
        if day?[indexPath.row][1] == "Afternoon Session" {
            cell.accessoryType = .disclosureIndicator
            cell.isUserInteractionEnabled = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activitiesViewController = ActivitiesViewController()
        activitiesViewController.activity = activity
        navigationController?.pushViewController(activitiesViewController, animated: true)
    }

}

class DayCell: UITableViewCell {
    
    let cellView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCell() {
        addSubview(cellView)
        cellView.addSubview(timeLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(locationLabel)
        
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        timeLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 8).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 20).isActive = true
        
        locationLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 20).isActive = true
    }
    
}
