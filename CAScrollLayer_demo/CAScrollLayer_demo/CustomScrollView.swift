//
//  CustomScrollView.swift
//  CAScrollLayer_demo
//
//  Created by daniel on 27/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import Foundation
//首先，创建出自定义的ScrollView
import UIKit
//CAScrollLayer 是UIScrollView的本质
class CustomScrollView: UIView {
    
    //重写该属性，作用是让原来的layer变成CAScrollLayer
    override class var layerClass : AnyClass {
        return CAScrollLayer.self
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //设置scrollView的layer的滚动模式
        (layer as! CAScrollLayer).scrollMode = CAScrollLayerScrollMode.both
            (layer as! CAScrollLayer).scrollMode = .both
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(pan:)))
        addGestureRecognizer(pan)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pan(pan: UIPanGestureRecognizer) {
        var newPoint = bounds.origin
        print(newPoint)
        newPoint.x -= pan.translation(in: self).x
        newPoint.y -= pan.translation(in: self).y
        pan.setTranslation(CGPoint.zero, in: self)
        (layer as! CAScrollLayer).scroll(to: newPoint)
    }
    
}
