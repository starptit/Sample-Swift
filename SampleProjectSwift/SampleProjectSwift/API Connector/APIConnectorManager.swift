//
//  APIConnectorManager.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/15/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct APIConnectorManager:ServiceRequestAPI,ServiceResponseAPI {
    
    var successCallBack:(Any)->()?
    var failureCallBack:(Any)->()?
    
    func requestToServer(pathUrl:String,method:Alamofire.Method ,sendData:[String: AnyObject],encodingType: ParameterEncoding,headers:[String:String]){
        
        let updatePath = String(format: "%@%@", BASE_URL,pathUrl)
        
        print("\(updatePath)")
        
        Alamofire.request(method, updatePath, parameters: sendData, encoding: encodingType, headers: headers)
            .response {
                
                (request, response, returnData, error) in
                if error != nil {
                    
                    self.failureCallBack(error)
                    
                } else {
                    if returnData != nil {
                        let json = JSON(data: returnData!)
                        self.successCallBack(json)
                    }else {
                        print("Response nil data")
                    }
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

}
