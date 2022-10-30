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
    
    private var currentTrafficLight = ""
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
    }
    
    @IBAction func trafficLightControllButtonTapped() {
        trafficLightControllButton.setTitle("Next", for: .normal)
        switch currentTrafficLight {
        case "red":
            currentTrafficLight = "yellow"
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
        case "yellow":
            currentTrafficLight = "green"
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
        default:
            currentTrafficLight = "red"
            greenLightView.alpha = 0.3
            redLightView.alpha = 1
        }
    }
    
    private func setupView() {
        [
            redLightView,
            yellowLightView,
            greenLightView
        ].forEach { trafficLightView in
            trafficLightView?.alpha = 0.3
            trafficLightView?.layer.cornerRadius = (trafficLightView?.frame.width ?? 50) / 2
        }
    }
    
    private func setupButton() {
        trafficLightControllButton.layer.cornerRadius = 10
    }
}

