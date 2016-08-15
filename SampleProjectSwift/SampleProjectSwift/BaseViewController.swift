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

class BaseViewController: UIViewController{
    
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
    
}

