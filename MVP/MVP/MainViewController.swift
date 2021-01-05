//
//  MainViewController.swift
//  MVP
//
//  Created by 허예은 on 2021/01/05.
//

import UIKit

class MainViewController: UIViewController {
    lazy var presenter = Presenter(with: self)
    
    @IBOutlet var ChangeTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        presenter.buttonTapped()
    }
}

extension MainViewController: PresenterView {
    func updateLabel() {
        ChangeTextField.text = "I have been changed!"
        
        self.view.backgroundColor = .yellow
    }
}
