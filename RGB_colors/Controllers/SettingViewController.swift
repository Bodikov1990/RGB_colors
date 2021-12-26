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
    
    var delegate: SettingViewControllerDelegate!
    var backgroundForRGB: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forBackground = CIColor(color: backgroundForRGB)
        rgbColorsView.backgroundColor = UIColor(red: forBackground.red, green: forBackground.green, blue: forBackground.blue, alpha: 1)
        
        rgbColorsView.layer.cornerRadius = 10
        rgbColorsView.layer.shadowColor = UIColor.black.cgColor
        rgbColorsView.layer.shadowOpacity = 4
        rgbColorsView.layer.shadowRadius = 10
        rgbColorsView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        getbackgrounColors()
        setValueTextField()
        setValueLabel(for: redLabel, greenLabel, blueLabel)
        setLabelWithTF(for: redColorTF, greenColorTF, blueColorTF)
        addDoneButtonTo(redColorTF, greenColorTF, blueColorTF)
    }
    
    @IBAction func rgbColorAction(_ sender: UISlider) {
        setColor()
        setValueTextField()
        
        switch sender {
        case redSlider:
            setValueLabel(for: redLabel)
        case greenSlider:
            setValueLabel(for: greenLabel)
        default:
            setValueLabel(for: blueLabel)
        }
    }
    
    @IBAction func doneAction() {
        view.endEditing(true)
        delegate.getColor(for: rgbColorsView.backgroundColor ?? .brown)
        dismiss(animated: true) { }
    }
    
    private func getbackgrounColors() {
        let forBackground = CIColor(color: backgroundForRGB)
        redSlider.value = Float(forBackground.red)
        greenSlider.value = Float(forBackground.green)
        blueSlider.value = Float(forBackground.blue)
    }
    
    private func setColor() {
        rgbColorsView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                                green: CGFloat(greenSlider.value),
                                                blue: CGFloat(blueSlider.value),
                                                alpha: 1)
    }
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = string(from: redSlider)
            case greenLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)

            }
        }
    }
    
    private func setLabelWithTF(for textFields: UITextField...){
        textFields.forEach { textField in
            switch textField {
            case redColorTF: redLabel.text = textField.text
            case greenColorTF: greenLabel.text = textField.text
            default: blueLabel.text = textField.text
            }
        }
    }
    
    private func setValueTextField() {
        redColorTF.text = string(from: redSlider)
        greenColorTF.text = string(from: greenSlider)
        blueColorTF.text = string(from: blueSlider)
    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

//MARK: - TextFieldDelegate

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
            setLabelWithTF(for: redColorTF, greenColorTF, blueColorTF)
        } else {
            showAlert(title: "Wrong format!", message: "Please enter correct format")
        }
    }
}

//MARK: - Alert and ToolBar

extension SettingViewController {
    
    private func addDoneButtonTo(_ textFields: UITextField...) {
        
        let numberToolbar = UIToolbar()
        numberToolbar.sizeToFit()
        textFields.forEach { textField in
            switch textField {
            case redColorTF: textField.inputAccessoryView = numberToolbar
            case greenColorTF: textField.inputAccessoryView = numberToolbar
            default: textField.inputAccessoryView = numberToolbar
            }
        }
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(tapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
 
        numberToolbar.items = [flexBarButton, doneButton]
        
    }
    
    @objc private func tapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
