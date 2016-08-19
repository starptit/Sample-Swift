//
//  ImageLoader.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/19/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import SDWebImage

class ImageLoader:NSObject,SDWebImageManagerDelegate {

    static let sharedInstance = ImageLoader()
    
    override init(){
        
    }
    
     func imageManager(imageManager: SDWebImageManager!, transformDownloadedImage image: UIImage!, withURL imageURL: NSURL!) -> UIImage! {
        
        var imageCopy = image
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let width = (appDel.window?.frame.size.width)!
        let height = (appDel.window?.frame.size.height)!
        
        let imageSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContext(imageSize)
        imageCopy.drawInRect(CGRect(x: 0, y: 0, width: width, height: height))
        imageCopy = UIGraphicsGetImageFromCurrentImageContext()
        
        return imageCopy
    }
    
//     func imageManager(imageManager: SDWebImageManager!, shouldDownloadImageForURL imageURL: NSURL!) -> Bool {
//        
//        return true
//    }
    
}

