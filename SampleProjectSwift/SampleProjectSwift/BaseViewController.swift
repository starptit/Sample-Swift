//
//  ViewController.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 6/16/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage


class BaseViewController: UIViewController{
    
    /*
    func requestToServer(pathUrl:String,method:Alamofire.Method ,sendData:[String: AnyObject],encodingType: ParameterEncoding,headers:[String:String]){
        
        let updatePath = String(format: "%@/%@", BASE_URL,pathUrl)
        
        print("\(updatePath)")
        
        Alamofire.request(method, updatePath, parameters: sendData, encoding: encodingType, headers: headers)
            .response { [unowned self] (request, response, returnData, error) in
                if error != nil {
                    
                    print("aaaaaaaa")
                    self.returnFailure(error!, fromRequest: request!)
                    
                } else {
                    let json = JSON(data: returnData!)
                   self.returnSuccess(json, fromRequest: request!)
            }
        }
    }
    
    
    func getDefaultHeaders() -> [String:String]{
        
        var defaultHeaders:[String:String] = [:]
        defaultHeaders["Accept"] = "application/json"
        defaultHeaders["Content-Type"] = "application/json"
        
        return defaultHeaders
    }
    
    func setCustomHeaders(customHeader:[String:String]) -> [String:String]{
        
        return customHeader
    }

    func returnSuccess(response:Any, fromRequest:Any){
        print("\(response) and \(fromRequest)")
    }
    
    func returnFailure(error:NSError, fromRequest:Any){
        print("\(error) and \(fromRequest)")
    }
    
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupImageWebCache()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        self.clearMemoryCache()
    }
    
    
    // FIXME: HIGHEST BEWARE FOR SIZE OF CACHING IMAGE
    func setupImageWebCache(){
        
        SDWebImageDownloader.sharedDownloader().shouldDecompressImages = false
        SDImageCache.sharedImageCache().shouldDecompressImages = false
        SDImageCache.sharedImageCache().shouldCacheImagesInMemory = false
        
        
        /***
         BEWARE: THIS LINE WILL SCALE AND COMPRESS RESOLUTION OF CACHING IMAGE.
         IF YOU WANT TO CACHING WHOLE RATIO AND RESOLUTION OF IMAGE, PLEASE COMMENT IT
         ***/
        SDWebImageManager.sharedManager().delegate = ImageLoader.sharedInstance
        /*** ***/
        
    }
    
    func clearMemoryCache(){
        SDImageCache.sharedImageCache().clearMemory()
        SDImageCache.sharedImageCache().clearDisk()
    }
    
}


