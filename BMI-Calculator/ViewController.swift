//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Artem on 12/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightUILabel: UILabel!
    @IBOutlet weak var weightUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightValueChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightUILabel.text = "\(height)m"
    }

    @IBAction func weightValueChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightUILabel.text = "\(weight)Kg"
    }
}

