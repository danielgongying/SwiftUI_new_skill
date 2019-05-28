//
//  ViewController.swift
//  CAReplicatorLayer_demo
//
//  Created by daniel on 28/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit
//一个图层，用于创建具有不同几何，时间和颜色变换的指定数量的子图层副本。您可以使用对象基于单个源图层构建复杂布局，该源图层使用可影响位置，旋转颜色和时间的转换规则进行复制
class ViewController: UIViewController {
    /*
     var instanceCount: Int
     要创建的副本数，包括源图层。
     
     var instanceDelay: CFTimeInterval
     指定复制副本之间的延迟（以秒为单位）。动画。
     
     var instanceTransform: CATransform3D
     变换矩阵应用于前一个实例以生成当前实例。动画。
     
     var preservesDepth: Bool
     定义此图层是否将其子图层展平为平面。
     
     var instanceColor: CGColor?
     定义用于乘以源对象的颜色。动画。
     
     var instanceRedOffset: Float
     定义为每个复制实例添加到颜色的红色分量的偏移量。动画。
     
     var instanceGreenOffset: Float
     定义为每个复制实例添加到颜色的绿色组件的偏移量。动画。
     
     var instanceBlueOffset: Float
     定义为每个复制实例添加到颜色的蓝色分量的偏移量。动画。
     
     var instanceAlphaOffset: Float
     定义为每个复制实例添加到颜色的alpha分量的偏移量。动画。*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let replicatorLayer = CAReplicatorLayer()
        let redSquare = CALayer()
        redSquare.backgroundColor = UIColor.white.cgColor
        redSquare.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let instanceCount = 10
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(110, 0, 0)
        let offsetStep = -1 / Float(instanceCount)
        replicatorLayer.instanceBlueOffset = offsetStep
        replicatorLayer.instanceGreenOffset = offsetStep
        
    //动画添加在CALayer
        let animation=CABasicAnimation.init(keyPath: "transform.scale.y")
        animation.toValue = 0.3
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.autoreverses = true
        redSquare.add(animation, forKey: nil)
        replicatorLayer.addSublayer(redSquare)
        
        
        //第二种动画
//        let ani = CAKeyframeAnimation.init(keyPath: "position")
////        let path = UIBezierPath.init(rect: CGRect(x: 0,y: 0,width: 200,height: 200))
//        let path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 100)
//        ani.path = path.cgPath
//        ani.duration = 3
//        ani.isRemovedOnCompletion = false
//        ani.fillMode = .forwards
//        ani.repeatCount = MAXFLOAT;
//        redSquare.add(ani, forKey: nil)
//        replicatorLayer.addSublayer(redSquare)

        
        //嵌套
        let outerReplicatorLayer = CAReplicatorLayer()
        outerReplicatorLayer.addSublayer(replicatorLayer)
        outerReplicatorLayer.instanceCount = instanceCount
        outerReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(0, 110, 0)
        outerReplicatorLayer.instanceColor=UIColor.red.cgColor
//        outerReplicatorLayer.instanceBlueOffset = offsetStep
        outerReplicatorLayer.instanceRedOffset=offsetStep
//        outerReplicatorLayer.instanceGreenOffset=offsetStep
        self.view.layer.addSublayer(outerReplicatorLayer)
    }


}
