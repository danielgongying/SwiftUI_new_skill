//
//  ViewController.swift
//  CATiledLayer_demo
//
//  Created by daniel on 27/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let v = CustomView.init(frame: self.view.bounds)
        view.backgroundColor = UIColor.white
        view.addSubview(v)
  
        
    }


}

