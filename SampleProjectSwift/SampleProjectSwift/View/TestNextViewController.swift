//
//  TestNextViewController.swift
//  SampleProjectSwift
//
//  Created by _Genesis_ on 8/15/16.
//  Copyright © 2016 _Genesis_. All rights reserved.
//

import UIKit

class TestNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var sendData:[String:AnyObject] = [:]
        sendData["offset"] = "0"
        sendData["limit"]  = "10"
        sendData["id"] = "0"
        sendData["sort"] = "0"
        sendData["type"] = "0"
        sendData["sessionToken"] = ""
        
        let service = APIConnectorManager(successCallBack: { (json) -> ()? in
            
            print("\(json)")
            
        }) { (error) -> ()? in
            print("\(error)")
        }
        
        let headers = service.getDefaultHeaders()
        service.requestToServer(SAMPLE_PATH, method: .POST, sendData: sendData, encodingType: .JSON,headers: headers)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionShare(sender: AnyObject) {
        let shareManager:ShareSNSManager = ShareSNSManager()
        var shareFb = shareManager.getShareInstance(ShareType.Facebook)
        
        shareFb?.shareWithObject("")
        
        shareFb = shareManager.getShareInstance(.KakaoTalk)
        shareFb?.shareWithObject("")

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    deinit{
        print("De init successfully")
    }
}
