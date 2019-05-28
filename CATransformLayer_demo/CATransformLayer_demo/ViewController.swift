//
//  ViewController.swift
//  CATransformLayer_demo
//
//  Created by daniel on 28/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit
//用于创建真正的3D图层层次结构的对象，而不是其他CALayer类使用的展平层次结构渲染模型
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        如果layer创建为a CALayer，则蓝色图层隐藏的绿色和红色图层将不会呈现
        let layer = CATransformLayer()// let layer = CALayer()
        layer.frame = self.view.bounds
        func layerOfColor(_ color: UIColor, zPosition: CGFloat) -> CALayer {
            let layer = CALayer()
            layer.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
            layer.backgroundColor = color.cgColor
            layer.zPosition = zPosition
            layer.opacity = 0.5
            
            return layer
        }
        
        layer.addSublayer(layerOfColor(.red, zPosition: 20))
        layer.addSublayer(layerOfColor(.white, zPosition: 40))
        layer.addSublayer(layerOfColor(.blue, zPosition: 60))
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 100
    
        layer.transform = CATransform3DRotate(perspective, 0.1, 0, 1, 0)
        self.view.layer.addSublayer(layer)
        view.backgroundColor = UIColor.green
    }


}


