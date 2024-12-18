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
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
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
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let bmi = weight / pow(height, 2)
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)
        self.present(secondVC, animated: true, completion: nil)
    }
}

