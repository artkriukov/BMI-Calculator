//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Artem on 12/17/24.
//

import UIKit

class CalculateViewController: UIViewController {
    
    private var calculatorBrain = CalculatorBrain()
    
    @IBOutlet private weak var heightUILabel: UILabel!
    @IBOutlet private weak var weightUILabel: UILabel!
    @IBOutlet private weak var heightSlider: UISlider!
    @IBOutlet private weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func heightValueChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightUILabel.text = "\(height)m"
    }

    @IBAction private func weightValueChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightUILabel.text = "\(weight)Kg"
    }
    
    @IBAction private func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

