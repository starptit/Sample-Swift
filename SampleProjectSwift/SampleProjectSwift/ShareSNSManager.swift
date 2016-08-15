//
//  ShareSNSManager.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/15/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit

/*
 public Enum for category Share and Login Type
 */
public enum ShareType {
    case Facebook
    case KakaoTalk
    case Instagram
    case Twitter
    case Naver
    case Email
}

/*
 abstract Protocol for Login method
 */
public protocol Shareable{
    func shareWithObject(withObject:Any)
}

/* --------Share conform to share abstract protocol------- */
public struct FacebookSharing:Shareable{
    
    public func shareWithObject(withObject: Any) {
    
        // fill code in here
        
        print("Share facebook")
    }
}

public struct KakaoTalkSharing:Shareable{
    public func shareWithObject(withObject: Any) {
        
        print("Share Kakao")
    }
}

public struct InstagramSharing:Shareable{
    public func shareWithObject(withObject: Any) {
        print("Share Insta")
    }
}

public struct TwitterSharing:Shareable{
    public func shareWithObject(withObject: Any) {
        
        print("Share Twitter")
    }
}

public struct NaverSharing:Shareable{
    public func shareWithObject(withObject: Any) {
        
        print("Share Naver")
    }
}
/* ----------------------------------------------------------- */

public struct ShareSNSManager{
    public func getShareInstance(method:ShareType) -> Shareable?{
        if method == .Facebook {
            
            return FacebookSharing()
        }else if method == .KakaoTalk {
            
            return KakaoTalkSharing()
        }else if method == .Twitter {
            
            return TwitterSharing()
        }else if method == .Instagram {
            
            return InstagramSharing()
        }else if method == .Naver {
            
            return NaverSharing()
        }
        
        return nil
    }
}