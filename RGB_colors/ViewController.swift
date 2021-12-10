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
        
        
        redLabel.font = redLabel.font.withSize(20)
        redLabel.textAlignment = .left
        
        
        greenLabel.font = greenLabel.font.withSize(20)
        greenLabel.textAlignment = .left
        
        blueLabel.font = blueLabel.font.withSize(20)
        blueLabel.textAlignment = .left
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        redSlider.value = 1
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumTrackTintColor = .green
        redSlider.thumbTintColor = .red
        
        greenSlider.value = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .blue
        greenSlider.thumbTintColor = .green
        
        blueSlider.value = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .red
        blueSlider.thumbTintColor = .blue
        
    }

    @IBAction func redSliderAction() {
        redLabel.text = String(redSlider.value)
//        let sliderValue = CGFloat(redSlider.value)
//        rgbColorsView.backgroundColor = .systemRed.withAlphaComponent(sliderValue)
    }
    @IBAction func greenSliderAction() {
        greenLabel.text = String(greenSlider.value)
//        let sliderValue = CGFloat(greenSlider.value)
//        rgbColorsView.backgroundColor = .green.withAlphaComponent(sliderValue)
    }
    @IBAction func blueSliderAction() {
        blueLabel.text = String(blueSlider.value)
//        let sliderValue = CGFloat(blueSlider.value)
//        rgbColorsView.backgroundColor = .blue.withAlphaComponent(sliderValue)
    }
    
}

