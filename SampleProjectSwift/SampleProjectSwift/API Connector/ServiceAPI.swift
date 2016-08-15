//
//  ServiceAPI.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/12/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit
import Alamofire

protocol ServiceResponseAPI {
    
//    func returnSuccess(response:Any, fromRequest:Any)
//    func returnFailure(error:NSError, fromRequest:Any)
    
    var successCallBack:(Any)->()? {get set}
    var failureCallBack:(Any)->()? {get set}
}


protocol ServiceRequestAPI {
    
    func requestToServer(pathUrl:String,method:Alamofire.Method ,sendData:[String: AnyObject],encodingType: ParameterEncoding,headers:[String:String])
    
    func getDefaultHeaders() -> [String:String]
    
    func setCustomHeaders(customHeader:[String:String]) -> [String:String]
    
}
