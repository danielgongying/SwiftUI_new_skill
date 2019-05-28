//
//  ViewController.swift
//  Xcode隐藏的自带功能
//
//  Created by daniel on 28/05/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let imageView = UIImageView.init(frame: self.view.bounds)
//       方式1. 当输入 image literal 会直接出现图片，双击可以进行选择,assets里面不会出现无法选择的现象
//        imageView.image = UIImage(named: "2.jpg")
        imageView.image = #imageLiteral(resourceName: "4")
        imageView.contentMode  = .scaleAspectFit
        view.addSubview(imageView)
//         当输入 color literal 会直接出现白色小方块，双击可以进行各种颜色的选择
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        
    }


}

