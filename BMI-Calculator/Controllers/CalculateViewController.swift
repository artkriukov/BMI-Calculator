//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Artem on 12/17/24.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"
    
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
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
}

