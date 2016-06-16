//
//  APIConnectorManager.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 6/16/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire
//import ConstantString

/*
 - Define a singleton class, connect to server by API, and return Data
 */

class APIConnectorManager: NSObject {
    static let sharedInstance = APIConnectorManager()
    
    func requestToServer(pathUrl:String,method:Alamofire.Method ,sendData:NSDictionary,
                         successReturn:((returnDic:NSMutableDictionary) -> ()),failReturn:((error:NSError) -> ())){
//        pathUrl = String(format: "%@/%@", BASE_URL,pathUrl)
        
//        Alamofire.request(method, pathUrl, parameters: <#T##[String : AnyObject]?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##[String : String]?#>)
        
//        Alamofire.request
    }
    
    
}
