//
//  ViewController.swift
//  CoreImage_demo
//
//  Created by daniel on 01/06/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit

 class ViewController: UIViewController {


    var resourceImage : UIImage?
    
    @IBAction func changeValue(_ sender: UISlider) {
        sender.isContinuous=false
        let image = self.chooseFilter(fileName: "CISepiaTone", values: [sender.value], filterKeys: [kCIInputIntensityKey], image:self.resourceImage!)
        self.imageView.image = image
        print(sender.value)
        print(Thread.current)
    }
    @IBOutlet weak var imageView: UIImageView!
    //重置功能
//    设置 self.resourceImage 为相应的图片即可
    
    //组合滤镜，在原有的处理的图片上再添加相应滤镜
    //某些滤镜占用CPU过大，如何处理？
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //        let image = self.chooseFilter(fileName: "CIBoxBlur", values: [10.0], filterKeys: [kCIInputRadiusKey], image: #imageLiteral(resourceName: "2"))
    let image = self.chooseFilterCategories(name: kCICategorySharpen, values: [5.0,10.0], filterKeys: [kCIInputRadiusKey,kCIInputIntensityKey], image: #imageLiteral(resourceName: "2"))
    self.resourceImage = image
        UIView.animate(withDuration: 0.3) {
            self.imageView.image = image
        }
        
    }

}




extension ViewController{
    //MARK:添加单个滤镜
    public func chooseFilter(fileName:String, values:[Float],filterKeys:[String],image:UIImage) -> UIImage {
        let context = CIContext()
        let filter = CIFilter(name: fileName)
        //解决需要同时设置value和key
        for i in 0..<filterKeys.count {
            filter?.setValue(values[i], forKey:filterKeys[i])
            print(i)
        }
        filter?.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        let result = filter?.outputImage
        let cgimage = context.createCGImage(result!, from: result!.extent)
        return UIImage(cgImage: cgimage!)
    }
    //MARK:添加滤镜类别，在类别里自己选择滤镜
    public func chooseFilterCategories(name:String,values:[Float],filterKeys:[String],image:UIImage)-> UIImage {
        let filters = CIFilter.filterNames(inCategory: name)
        print("包含的所有滤镜名称:")
        for filter in filters {
            print(filter)
            //判断是属于那种滤镜
            if filter == "CIUnsharpMask" {
                print("haha")
                let image = self.chooseFilter(fileName: filter, values: values, filterKeys: filterKeys, image: image)
                return image
            }
            
            
        }
        return image
    }
}
