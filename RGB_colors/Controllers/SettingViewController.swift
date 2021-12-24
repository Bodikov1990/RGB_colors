//
//  ViewController.swift
//  RGB_colors
//
//  Created by Kuat Bodikov on 10.12.2021.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var rgbColorsView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redColorTF: UITextField!
    @IBOutlet weak var greenColorTF: UITextField!
    @IBOutlet weak var blueColorTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbColorsView.layer.cornerRadius = 10
        rgbColorsView.layer.shadowColor = UIColor.black.cgColor
        rgbColorsView.layer.shadowOpacity = 4
        rgbColorsView.layer.shadowRadius = 10
        rgbColorsView.layer.shadowOffset = CGSize(width: 5, height: 5)
 
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        setValueLabel(for: redLabel, greenLabel, blueLabel)
        setValueTextField()
    }
    
    @IBAction func rgbColorAction(_ sender: UISlider) {
        setColor()
        setValueTextField()
        
        switch sender {
        case redSlider: setValueLabel(for: redLabel)
        case greenSlider: setValueLabel(for: greenLabel)
        default: setValueLabel(for: blueLabel)
        }
    }
    
    
    private func setColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        rgbColorsView.backgroundColor = UIColor(red: red,
                                                green: green,
                                                blue: blue,
                                                alpha: 1)
    }
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = string(from: redSlider)
                label.text = redColorTF.text
            case greenLabel:
                label.text = string(from: greenSlider)
                label.text = greenColorTF.text
            default:
                label.text = string(from: blueSlider)
                label.text = blueColorTF.text
            }
        }
    }
    
    private func setValueTextField() {
        redColorTF.text = string(from: redSlider)
        greenColorTF.text = string(from: greenSlider)
        blueColorTF.text = string(from: blueSlider)
    }
    
//    private func testValueTF(for textFields: UITextField...){
//        textFields.forEach { textField in
//            switch textField {
//            case redColorTF: return
//
//            default:
//                break
//            }
//        }
//    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.1f", slider.value)
    }
}

extension SettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            setColor()
            setValueTextField()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct format")
        }
    }
}

extension SettingViewController {
    private func showAlert(title: String, message: String) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                present(alert, animated: true)
            }
}
