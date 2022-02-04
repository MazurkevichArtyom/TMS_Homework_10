//
//  PanCircleViewController.swift
//  HW10
//
//  Created by Artem Mazurkevich on 04.02.2022.
//

import UIKit

class PanCircleViewController: UIViewController {

    private let startColor = UIColor(red: 2 / 255.0, green: 170 / 255.0, blue: 176 / 255.0, alpha: 1)
    private let endColor = UIColor(red: 0 / 255.0, green: 205 / 255.0, blue: 171 / 255.0, alpha: 1)
    private let step = 10.0
    private let buttonSize = 40.0
    private var circleView: UIView!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .darkGray
        view = customView
        
        setupGeneralGestureRecognizer()
        setupCircleView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = .systemOrange
    }
    
    override func viewWillLayoutSubviews() {
        circleView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    }
    
    private func setupCircleView() {
        let diameter = min(view.bounds.height, view.bounds.width) * 0.2
        let gradientLayer = CAGradientLayer()
        
        circleView = UIView(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        circleView.layer.cornerRadius = diameter / 2.0
        circleView.isUserInteractionEnabled = true
        
        gradientLayer.frame = circleView.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = diameter / 2.0
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        circleView.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(circleView)
    }
    
    private func setupGeneralGestureRecognizer() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(onPanned))
        view.addGestureRecognizer(panGR)
    }
    
    @objc private func onPanned(gesture: UIPanGestureRecognizer) {
        circleView.center = gesture.location(in: view)
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
