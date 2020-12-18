//
//  TimeViewController.swift
//  ElsieApp
//
//  Created by Ross Harding on 8/17/19.
//  Copyright © 2019 Harding LLC. All rights reserved.
//

import UIKit

class TimeViewController: ParentViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    var timer = Timer()
    var startDate: Double = 1551592800 // Epoch time of beginning of relationship
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(calculateTime), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    @objc func calculateTime() {
        let now = Date().timeIntervalSince1970
        let total = now - startDate
        let years = floor(total / 31536000)
        let days = floor((total - (years * 31536000)) / 86400)
        let hours = floor((total - (years * 31536000) - (days * 86400)) / 3600)
        let minutes = floor((total - (years * 31536000) - (days * 86400) - (hours * 3600)) / 60)
        let seconds = floor((total - (years * 31536000) - (days * 86400) - (hours * 3600) - (minutes * 60)))
        
        let yearString = years.format(with: "year")
        let dayString = days.format(with: "day")
        let hourString = hours.format(with: "hour")
        let minuteString = minutes.format(with: "minute")
        let secondString = seconds.format(with: "second")
        let formattedString = yearString + dayString + hourString + minuteString + secondString
        
        timeLabel.text = formattedString
    }
    
}
