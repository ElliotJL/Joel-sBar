//
//  MenuOptionViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 01/03/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class MenuOptionViewController: UIViewController {

    var pageTitle: String?
    var optionContent: String?
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Futura", size: 20)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFrame()
        showContent()
    }
    
    func setFrame() {
        view.backgroundColor = .white
        navigationItem.title = pageTitle
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
    }
    
    func showContent() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        scrollView.addSubview(contentLabel)
        contentLabel.text = optionContent
        contentLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        contentLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8).isActive = true
    }
    
}
