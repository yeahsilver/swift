//
//  ViewController.swift
//  LottieTest
//
//  Created by 허예은 on 2021/01/09.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var startAnimationView: AnimationView!
    let startAnimation = Animation.named("travel")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimationView.backgroundColor = .clear
        startAnimationView.loopMode = .loop
        startAnimationView.animation = startAnimation
        startAnimationView.play()
    }


}

