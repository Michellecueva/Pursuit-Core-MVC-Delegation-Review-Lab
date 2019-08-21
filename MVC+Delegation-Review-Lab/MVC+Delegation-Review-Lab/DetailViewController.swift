//
//  DetailViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Michelle Cueva on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    var delegate: FontDelegate!
    
    var startingValue = StartingValue.startingFontSize
    
    var currentFontSize: CGFloat! {
        didSet {
            delegate?.changeFont(size: currentFontSize)
            updateAllElements()
        }
    }
    
    
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        currentFontSize = round(CGFloat(sender.value))
        
    }
    
    
    @IBAction func changeStepperValue(_ sender: UIStepper) {
       currentFontSize = CGFloat(sender.value)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentFontSize = startingValue

    }
    
    func updateAllElements() {
        stepper.value = Double(currentFontSize)
        slider.value = Float(currentFontSize)
        fontSizeLabel.text = currentFontSize.description
        
    }
}


