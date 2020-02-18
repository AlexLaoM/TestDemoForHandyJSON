//
//  ViewController.swift
//  DemoForHandyJSON
//
//  Created by alex on 2020/2/17.
//  Copyright © 2020 alex. All rights reserved.
//

import UIKit
import HandyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = URL.init(fileURLWithPath: Bundle.main.path(forResource: "testData", ofType: "json")!)
        let data = try? Data.init(contentsOf: path)
        let jsonData:Any = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
        let result = BaseResultResponse.deserialize(from: jsonData as? Dictionary)
        print(result?.code)
    }
}


class BaseResultResponse: HandyJSON {
    required init() {
        
    }
    
    var code: Int?
    var msg: String?
    var data: Any?
    
}



