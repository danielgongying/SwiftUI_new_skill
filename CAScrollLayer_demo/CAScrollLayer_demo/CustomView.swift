//
//  CustomView.swift
//  CAScrollLayer_demo
//
//  Created by daniel on 27/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import Foundation
import UIKit
class CustomView: UIView {
    override class var layerClass: AnyClass {
        return CATiledLayer.self
    }
    override func draw(_ rect: CGRect) {
        //  Converted to Swift 5 by Swiftify v5.0.28117 - https://objectivec2swift.com/
        //将视图frame映射到实际图片的frame
        
        //将视图frame映射到实际图片的frame
        let imageCutRect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        //截取指定图片区域，重绘

        let image = UIImage.init(named: "111.jpg");
        
        let imageRef = CGImage.init(jpegDataProviderSource: CGDataProvider as! CGDataProvider.self, decode: UnsafePointer<CGFloat>?, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
        var tileImage: UIImage? = nil
        if let imageRef = imageRef {
            tileImage = UIImage(cgImage: imageRef)
        }
        let context = UIGraphicsGetCurrentContext()
        if let context = context {
            UIGraphicsPushContext(context)
        }
        tileImage?.draw(in: rect)
        UIGraphicsPopContext()
        
    }

}
