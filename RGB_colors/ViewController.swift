//
//  ViewController.swift
//  RGB_colors
//
//  Created by Kuat Bodikov on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rgbColorsView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbColorsView.layer.cornerRadius = 10
        
        redLabel.font = redLabel.font.withSize(20)
        redLabel.textAlignment = .left
        
        greenLabel.font = greenLabel.font.withSize(20)
        greenLabel.textAlignment = .left
        
        blueLabel.font = blueLabel.font.withSize(20)
        blueLabel.textAlignment = .left
        
        redSlider.value = 0.3
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
        
        greenSlider.value = 0.5
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
        
        blueSlider.value = 0.8
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
        
    }
    
    @IBAction func getRGBcolors() {
        redLabel.text = String(round(redSlider.value * 100) / 100)
        greenLabel.text = String(round(greenSlider.value * 100) / 100)
        blueLabel.text = String(round(blueSlider.value * 100) / 100)
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        rgbColorsView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

