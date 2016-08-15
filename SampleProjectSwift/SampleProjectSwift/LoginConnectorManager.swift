//
//  LoginConnectorManager.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/15/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit

/*
 abstract Protocol for Login method
 */
protocol Loginable {
    func login()
}


/* --------Login Type conform to login abstract protocol------- */
struct LoginEmail:Loginable{
    func login() {
        
    }
}

struct LoginFacebook:Loginable {
    func login() {
        
    }
}

struct LoginKakaoTalk:Loginable {
    func login() {
        
    }
}

struct LoginInstagram:Loginable {
    func login() {
        
    }
}

struct LoginNaver:Loginable {
    func login() {
        
    }
}

struct LoginTwitter:Loginable {
    func login() {
        
    }
}
/* ----------------------------------------------------------- */
 
struct LoginManager{
    func getLoginType(method:ShareType) -> Loginable?{
        if method == .Facebook {
            
            return LoginFacebook()
        }else if method == .KakaoTalk {
            
            return LoginKakaoTalk()
        }else if method == .Twitter {
            
            return LoginTwitter()
        }else if method == .Instagram {
            
            return LoginInstagram()
        }else if method == .Naver {
            
            return LoginNaver()
        }else if method == .Email{
         
            return LoginEmail()
        }
        
        return nil
    }
}


public struct LoginObject{
    var userName:String?
    var password:String?
    var email:String?
}
