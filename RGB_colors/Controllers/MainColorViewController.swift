//
//  MainColorViewController.swift
//  RGB_colors
//
//  Created by Kuat Bodikov on 24.12.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func getColor(for background: UIColor)
}

class MainColorViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.delegate = self
        settingVC.backgroundForRGB = view.backgroundColor
    }
}

extension MainColorViewController: SettingViewControllerDelegate {
    func getColor(for bacgkround: UIColor) {
        view.backgroundColor = bacgkround
    }
}

