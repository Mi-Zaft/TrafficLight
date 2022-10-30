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
            changeColorTrafficLight("yellow", redLightView, yellowLightView)
        case "yellow":
            changeColorTrafficLight("green", yellowLightView, greenLightView)
        default:
            changeColorTrafficLight("red", greenLightView, redLightView)
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
    
    private func changeColorTrafficLight(
        _ colorName: String,
        _ beforeColor: UIView,
        _ nextColor: UIView
    ) {
        currentTrafficLight = colorName
        beforeColor.alpha = 0.3
        nextColor.alpha = 1
    }
}

