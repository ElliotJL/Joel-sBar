//
//  HomeViewController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 26/02/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFrame()
        showContent()
    }
    
    func setFrame() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "jblogoblack"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 52, height: 40)
        navigationItem.titleView = imageView
    }
    
    func showContent() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let imageOne = addImage(imageName: "jbmainbg")
        imageOne.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
        let welcomeLabel = addLabel(content: """
            Joel's Bar is the youth conference of Celebrate - Catholic Charismatic events that happen throughout the year. Joel's Bar is back once again at Worth Abbey in 2019 for Easter, in the extraordinarily beautiful setting of the Sussex countryside.
            
            Our passion at JB is for relationship, fellowship and faith coming to life. Through our timetable of speakers, worship, Mass, prayer with the monks and times of ministry, we set the space for this. We’re also excited to have evenings of entertainment, a daytime café and evening bar throughout the week and loads more opportunities to meet new people. The age range of Joel's Bar is from Year 12 - 25 years old so if you fall into that bracket, book up quickly!
            
            Whether you’ve been to JB before or not, part of a Cathsoc or CU, coming with friends, family or coming alone, we can't wait to see you!
            """)
        welcomeLabel.topAnchor.constraint(equalTo: imageOne.bottomAnchor, constant: 20).isActive = true
        
        let imageTwo = addImage(imageName: "jbpic1")
        imageTwo.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20).isActive = true
        imageTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func addImage(imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(imageView)
        
        imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.6656).isActive = true
        
        return imageView
    }
    
    func addLabel(content: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = content
        label.font = UIFont(name: "Futura", size: 20)
        
        scrollView.addSubview(label)
        
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        return label
    }

}
