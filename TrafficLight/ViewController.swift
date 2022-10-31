//
//  ViewController.swift
//  TrafficLight
//
//  Created by Максим Евграфов on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var trafficLightControllButton: UIButton!
    
    private var currentTrafficLight = CurrentTrafficLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trafficLightControllButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
    }
    
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    @IBAction func trafficLightControllButtonTapped() {
        if trafficLightControllButton.currentTitle == "START" {
            trafficLightControllButton.setTitle("Next", for: .normal)
        }
        
        switch currentTrafficLight {
        case .red:
            currentTrafficLight = .yellow
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
        case .yellow:
            currentTrafficLight = .green
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
        case .green:
            currentTrafficLight = .red
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
        }
    }
}

// MARK: - CurrentTrafficLight
extension ViewController {
    private enum CurrentTrafficLight {
        case red, yellow, green
    }
}
