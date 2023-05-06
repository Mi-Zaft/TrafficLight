//
//  ViewController.swift
//  TrafficLight
//
//  Created by Максим Евграфов on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var conditionLightButton: UIButton!
    
    private var activeLight = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        
        conditionLightButton.layer.cornerRadius = 10
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redLightView.layer.cornerRadius = redLightView.layer.bounds.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.size.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.size.width / 2
    }

    @IBAction func conditionLightButtonDidTapped() {
        if conditionLightButton.currentTitle == "START" {
            conditionLightButton.setTitle("NEXT", for: .normal)
        }
        
        switch activeLight {
        case "yellow":
            activeLight = "green"
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
        case "red":
            activeLight = "yellow"
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
        default:
            activeLight = "red"
            redLightView.alpha = 1
            greenLightView.alpha = 0.3
        }
    }
}

