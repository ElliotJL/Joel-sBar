//
//  ActivitiesViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 01/03/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class ActivitiesViewController: UITableViewController {

    var activity: [[String]]?
    let activityCellId = "activityCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFrame()

        tableView.register(ActivityCell.self, forCellReuseIdentifier: activityCellId)
        tableView.tableFooterView = UIView()        
    }
    
    func setFrame() {        
        navigationItem.title = "Afternoon Activities"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let activityCount = activity?.count {
            return activityCount
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: activityCellId, for: indexPath) as! ActivityCell
        cell.titleLabel.text = activity?[indexPath.row][0]
        cell.leaderLabel.text = activity?[indexPath.row][1]
        cell.locationLabel.text = activity?[indexPath.row][2]
        cell.descriptionLabel.text = activity?[indexPath.row][3]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

class ActivityCell: UITableViewCell {
    
    let cellView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 24)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let leaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 20)
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 20)
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        cellView.addSubview(titleLabel)
        cellView.addSubview(leaderLabel)
        cellView.addSubview(locationLabel)
        cellView.addSubview(descriptionLabel)
        
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 12).isActive = true
        
        leaderLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        leaderLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 12).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: leaderLabel.bottomAnchor).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 12).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 12).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -12).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
    }
    
}
