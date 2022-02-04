//
//  ViewController.swift
//  HW10
//
//  Created by Artem Mazurkevich on 04.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapCircleButton(_ sender: Any) {
        let gameVC = TapCircleViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @IBAction func onSwipeCircleButton(_ sender: Any) {
        let gameVC = SwipeCircleViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @IBAction func onPanCircleButton(_ sender: Any) {
        let gameVC = PanCircleViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
}

