//
//  ViewController.swift
//  iOSTraining-5
//
//  Created by Manami Ichikawa on 5/12/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let url = "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=fcd458b7f390f29fdf4d5d04d4c60e42&format=json&areacode_m=AREAM2178"
var shops: [[String: String?]] = []
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            Alamofire.request(url, method: .get, parameters: nil, headers: nil).responseJSON { (response:DataResponse<Any>) in
                let data  =  response.result.value
                print (data as Any)
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil
                    {
                        print("YOUR JSON DATA>>  \(response.data!)")
                    }
                        
                    break
                        
                case .failure(_):
                    print(response.result.error as Any)
                
                    break
                    
                }
                
                let json = JSON(data!)
                json.forEach {(_, json) in
                    
                    let shop: [String: String?] = [
                    "address": json["address"].string,

                    
                    
                    ]
                
                
                }
            }
    }

}

