//
//  ViewController.swift
//  CAScrollLayer_demo
//
//  Created by daniel on 27/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var scrollView: CustomScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = CustomScrollView(frame: CGRect(x: view.frame.width/2-100, y: 100, width: 200, height: 200))
        
        let image = UIImageView(frame: scrollView.bounds)
        image.image = UIImage(named: "111.jpg")
        image.contentMode = .center
        
        scrollView.addSubview(image)
        view.addSubview(scrollView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

