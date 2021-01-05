//
//  ScreenshotViewController.swift
//  Album
//
//  Created by 허예은 on 2021/01/05.
//

import UIKit

class ScreenshotViewController: UIViewController {
    var image: UIImage? = nil

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
    }
    
}
