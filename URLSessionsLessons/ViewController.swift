//
//  ViewController.swift
//  URLSessionsLessons
//
//  Created by Shadrach Mensah on 13/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var datePicker:UIDatePicker!
    var calcButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        calcButton = UIButton()
        view.addSubview(datePicker)
        view.addSubview(calcButton)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            datePicker.heightAnchor.constraint(equalToConstant: 120),
            calcButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 40),
            calcButton.widthAnchor.constraint(equalToConstant: 200),
            calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            calcButton.heightAnchor.constraint(equalToConstant: 35)
            
        ])

        calcButton.setTitle("Calculate Prime Numbers", for: .normal)
        calcButton.backgroundColor = UIColor.groupTableViewBackground
        calcButton.setTitleColor(.blue, for: .normal)
        calcButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    


    
    @objc func calculate(){
       let sessions = Sessions()
        sessions.fetch()
    }
    
    
}

