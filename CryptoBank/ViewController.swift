//
//  ViewController.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 23/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cryp = CryptoNetwork()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.get_crptodata(){ (success,fail) in
            if success == false {
                return
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func get_crptodata(_ completion: @escaping (_ done: Bool, _ error: String?) -> Void){
        let cryp = CryptoNetwork()
        
        cryp.get_data(completion: {error,data in
            
            if error != nil{
                completion(false,error)
                return
            }
            
            else{
                print(data)
            }
            
            
            
        })
    }
}

