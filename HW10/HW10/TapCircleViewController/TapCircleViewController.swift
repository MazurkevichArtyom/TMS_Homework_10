//
//  TapCircleViewController.swift
//  HW10
//
//  Created by Artem Mazurkevich on 04.02.2022.
//

import UIKit

class TapCircleViewController: UIViewController {

    private let startColor = UIColor(red: 2 / 255.0, green: 170 / 255.0, blue: 176 / 255.0, alpha: 1)
    private let endColor = UIColor(red: 0 / 255.0, green: 205 / 255.0, blue: 171 / 255.0, alpha: 1)
    private var circleView: UIView!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .darkGray
        view = customView
        
        setupGeneralTapGestureRecognizer()
        setupCircleView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = .systemOrange
    }
    
    private func setupGeneralTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onUpdateCircleLocation))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupCircleView() {
        let diameter = min(view.bounds.height, view.bounds.width) * 0.2
        let gradientLayer = CAGradientLayer()
        
        circleView = UIView(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        circleView.layer.cornerRadius = diameter / 2.0
        
        gradientLayer.frame = circleView.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = diameter / 2.0
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        circleView.layer.insertSublayer(gradientLayer, at: 0)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onHideCircleView))
        circleView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func onHideCircleView() {
        circleView.removeFromSuperview()
    }
    
    @objc private func onUpdateCircleLocation(gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: view)
        addAndUpdateCircleLocationIfNeeded(center: point)
    }
    
    private func addAndUpdateCircleLocationIfNeeded(center: CGPoint) {
        circleView.center = center
        
        if circleView.superview == nil {
            view.addSubview(circleView)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
