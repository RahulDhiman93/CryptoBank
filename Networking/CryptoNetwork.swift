//
//  CryptoNetwork.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 23/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import Foundation


struct CryptoNetwork{
    
    
    
    mutating func get_data(completion:@escaping (_ error:String?,_ data:[String]?)->()){
        
        var cryptoname:[String] = []
        var cname:[String] = []
        
        let url = URL(string:"https://api.coinmarketcap.com/v1/ticker/")!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url){ data,response,error in
            
            if error != nil{
                completion(error?.localizedDescription,nil)
                return
            }
            
            let parsedata = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
            //print(parsedata)
            
            
            for names in parsedata{
                if let name = names["name"] as? String{
                    cryptoname.append(name)
                }
            }
            cname = cryptoname
            completion(nil,cname)
            
        }
        task.resume()
    }
    
    
}
