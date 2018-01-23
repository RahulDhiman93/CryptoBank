//
//  CryptoNetwork.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 23/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import Foundation


struct CryptoNetwork{
    
    func get_data(completion:@escaping (_ error:String?,_ data:String?)->()){
        
        let url = URL(string:"https://api.coinmarketcap.com/v1/ticker/")!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url){ data,response,error in
            
            if error != nil{
               // completion(error?.localizedDescription,nil)
                return
            }
            
            let parsedata = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
            
            print(parsedata)
            
        }
        task.resume()
    }
    
    
}
