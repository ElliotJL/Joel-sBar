//
//  FaqViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 01/03/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class FaqViewController: UITableViewController {
    
    let faqCellId = "faqCellId"
    let faqs =
        [["Example question 1", "1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."],
        ["Example question 2", "2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."],
        ["Example question 3", "3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mollis lobortis odio, eu elementum ex pretium ac. In blandit consequat tortor, sed elementum tortor aliquam quis. Aenean sed lacus mollis, accumsan est quis, condimentum lorem. Nam nec ex sit amet massa accumsan feugiat. Proin id suscipit elit. Phasellus mattis interdum lacinia."]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFrame()
        
        tableView.register(FaqCell.self, forCellReuseIdentifier: faqCellId)
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
        return faqs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: faqCellId, for: indexPath) as! FaqCell
        cell.questionLabel.text = faqs[indexPath.row][0]
        cell.answerLabel.text = faqs[indexPath.row][1]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

class FaqCell: UITableViewCell {
    
    let cellView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 24)
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 20)
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
        cellView.addSubview(questionLabel)
        cellView.addSubview(answerLabel)
        
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        questionLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 12).isActive = true
        questionLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -12).isActive = true
        
        answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor).isActive = true
        answerLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 12).isActive = true
        answerLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -12).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
    }
    
}
