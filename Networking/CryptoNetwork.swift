//
//  CryptoNetwork.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 23/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import Foundation


struct CryptoNetwork{
    
    
    
    mutating func get_data(completion:@escaping (_ error:String?,_ data:[String]?,_ price:[String]?,_ symbol:[String]?,_ change24h:[String]?,_ ranking:[String]?,_ changeweekly:[String]?,_ change7day:[String]?)->()){
        
        var cryptoname:[String] = []
        var cname:[String] = []
        var priceUSD:[String] = []
        var symb:[String] = []
        var change1day:[String] = []
        var ranking:[String] = []
        var change1week:[String] = []
        var change7day:[String] = []
        
        let url = URL(string:"https://api.coinmarketcap.com/v1/ticker/")!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url){ data,response,error in
            
            if error != nil{
                completion(error?.localizedDescription,nil,nil,nil,nil,nil,nil,nil)
                return
            }
            
            let parsedata = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
            //print(parsedata)
            
            
            for names in parsedata{
                if let name = names["name"] as? String{
                    cryptoname.append(name)
                }
            }
            
            for price in parsedata{
                if let usd = price["price_usd"] as? String{
                    priceUSD.append(usd)
                }
            }
            
            for symbi in parsedata{
                if let symbol = symbi["symbol"] as? String{
                    symb.append(symbol)
                }
            }
            
            for chng in parsedata{
                if let change = chng["percent_change_24h"] as? String{
                    change1day.append(change)
                }
            }
            
            for rak in parsedata{
                if let rank = rak["rank"] as? String{
                    ranking.append(rank)
                }
            }
            
            for chng1w in parsedata{
                if let change = chng1w["percent_change_1h"] as? String{
                    change1week.append(change)
                }
            }
            
            for change7daay in parsedata {
                if let change = change7daay["percent_change_7d"] as? String{
                    change7day.append(change)
                }
            }
            
            
           // print("price ticker")
            //print(change1day)
           // print(Float(change1day[1])!)
            cname = cryptoname
            completion(nil,cname,priceUSD,symb,change1day,ranking,change1week,change7day)
            
        }
        task.resume()
    }
    
    
}
