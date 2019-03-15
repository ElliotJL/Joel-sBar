//
//  MenuViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 26/02/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    let menuCellId = "menuCellId"
    let options = ["Emergencies", "Site Rules", "Fire Safety", "Security"]
    let optionContent =
        ["Emergencies Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia.",
        "Site Rules Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia.",
        "Fire Safety Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia.",
        "Security Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFrame()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: menuCellId)
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
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellId, for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Futura", size: 20)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOptionViewController = MenuOptionViewController()
        menuOptionViewController.pageTitle = options[indexPath.row]
        menuOptionViewController.optionContent = optionContent[indexPath.row]
        navigationController?.pushViewController(menuOptionViewController, animated: true)
    }
    
}
