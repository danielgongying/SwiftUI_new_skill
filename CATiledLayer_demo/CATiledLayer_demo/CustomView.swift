//
//  CustomView.swift
//  CATiledLayer_demo
//
//  Created by daniel on 27/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import Foundation
import UIKit
class CustomView: UIView {
      let sideLength: CGFloat = 20
    override class var layerClass: AnyClass {
//        return CATiledLayer.self
        return TiledLayer.self
    }
//    override func draw(_ rect: CGRect) {
//        // UIView使用-drawRect：来确定是否应该允许其CALayer
//        //无效，这将导致图层创建后备存储和
//        // -drawLayer：inContext：被调用。
//        //通过实现一个空的-drawRect：方法，我们允许UIKit继续实现
//        //这个逻辑，同时在-drawLayer：inContext中进行真正的绘图工作：
//
//    }
//    override func draw(_ layer: CALayer, in ctx: CGContext) {
//        //在这里做你所有的绘画 不要使用UIGraphics进行任何绘图，而是使用Core Graphics。

//    }
//
    // 2
    override init(frame: CGRect) {
        super .init(frame: frame)
        srand48(Int(Date().timeIntervalSince1970))
        let layer = self.layer as! TiledLayer
        let scale = UIScreen.main.scale
        print(scale)
        layer.contentsScale = scale
        layer.setFadeDuration(5.0)
        //数值越大，CPU和Memory占用越大
        layer.levelsOfDetail=1
        layer.levelsOfDetailBias=10
        layer.tileSize = CGSize(width: sideLength * scale, height: sideLength * scale)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        srand48(Int(Date().timeIntervalSince1970))
        let layer = self.layer as! TiledLayer
        let scale = UIScreen.main.scale
        layer.contentsScale = scale
        //数值越大，CPU和Memory占用越大
        layer.levelsOfDetail=1
        layer.levelsOfDetailBias=10
        layer.setFadeDuration(5.0)
        layer.tileSize = CGSize(width: sideLength * scale, height: sideLength * scale)
    }
    
    // 3
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        context?.setFillColor(red: red, green: green, blue: blue, alpha: 1.0)
        context?.fill(rect)
          //获取上下文
        let context1 = UIGraphicsGetCurrentContext()
        //设置直线宽度
        context1?.setLineWidth(5.0)
        //设置画笔颜色
        context1?.setStrokeColor(UIColor.yellow.cgColor)
            //设置背景填充颜色
        context1?.setFillColor(UIColor.blue.cgColor)
            //设置绘制圆形的区域
        context1?.addEllipse(in: CGRect(x: 40, y: 40, width: 120, height: 120))

            //绘制路径
       context1?.fillPath()
        //在子线程渲染，如果不使用CATiledLayer 则在主线程渲染
        print(Thread.current)
        
 
    }
  
    
    
}
var adjustableFadeDuration: CFTimeInterval = 0.25
class TiledLayer: CATiledLayer {
    
    override class func fadeDuration() -> CFTimeInterval {
        return adjustableFadeDuration
    }
    
    open   func setFadeDuration(_ duration: CFTimeInterval) {
        adjustableFadeDuration = duration
}
    
    
}
