//
//  ViewController.swift
//  Gradients_demo
//
//  Created by daniel on 05/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit
import Gradients
class ViewController: UIViewController {

    var layer:CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let customLayer = Gradients.linear(to: .degree(-225), colors: [0x231557, 0x44107A, 0xFF1361, 0xFFF800], locations: [0.0, 0.29, 0.67, 1.0]) // Fabled Sunset
//        customLayer.frame = view.bounds
//        view.layer.addSublayer(customLayer)
        let layer = Gradients.redSalvation.layer
        self.layer = layer
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
 
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches.count)
     
        self.changeColor()
        
  
        
    }
    func changeColor()  {
        let num = Int(arc4random()%180)
        print(num)
        let layer = Gradients.init(rawValue: num)?.layer
        layer?.frame = self.view.bounds
        self.view.layer.addSublayer(layer!)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
           self.changeColor()
        }
     
    }


}

