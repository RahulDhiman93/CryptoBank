//
//  ViewController.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 23/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ind: UIActivityIndicatorView!
    
    var i = 1
    
    
    let cryp = CryptoNetwork()
    var currencyNames:[String] = []
    var priceusd:[String] = []
    var symb:[String] = []
    var change24hours:[String] = []
    var ranking:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scheduledTimerWithTimeInterval()
        tableView.delegate = self
        tableView.dataSource = self
       
        self.view?.alpha = 0.6
        self.ind.startAnimating()
        self.networkingAPI()
        
        print(currencyNames)
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func networkingAPI(){
        DispatchQueue.main.async {
            self.get_crptodata(){ (success,fail,names,price,symbol,change,rank) in
                if success == false {
                    return
                }
                else{
                    DispatchQueue.main.async {
                        self.ind.stopAnimating()
                        self.view?.alpha = 1
                        self.currencyNames = names!
                        self.priceusd = price!
                        self.symb = symbol!
                        self.change24hours = change!
                        self.ranking = rank!
                        print(self.priceusd.count)
                        print("COUNT")
                        print(self.currencyNames.count)
                        self.tableView.reloadData()
                    }
                    
                }
            }
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("in count")
        print(currencyNames.count)
        return currencyNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        print("IN CELLLLLLLL")
        let arName = currencyNames[indexPath.row]
        let prPrice = priceusd[indexPath.row]
        let symbol = symb[indexPath.row]
        let chaneg24h = change24hours[indexPath.row]
        let rank = ranking[indexPath.row]
        print("in arname")
        print(arName)
       cell.CurrencyTitle.text = arName
        cell.priceUSD.text = String(prPrice)
        cell.symbol.text = symbol
        
       
        print(rank)
        cell.change24H.text = chaneg24h
        
        return cell
}
    
   
    func get_crptodata(_ completion: @escaping (_ done: Bool, _ error: String?,_ gotit: [String]?,_ price:[String]?,_ symbol:[String]?,_ change:[String]?,_ rank:[String]?) -> Void){
        var cryp = CryptoNetwork()
       
        
        cryp.get_data(completion: {error,data,price,symbol,change,rank in
            
            if error != nil{
                completion(false,error,nil,nil,nil,nil,nil)
                return
            }
            
            else{
                  DispatchQueue.main.async {
                    print("DONE")
             completion(true,nil,data!,price!,symbol!,change!,rank!)
                    //self.tableView.reloadData()
            }
            }
        })
        //print(array)
        
    }
    
    func UISetup(enable: Bool){
        self.tableView.isEditing = enable
    }
    
    var timer = Timer()
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        print("im updating again")
        self.networkingAPI()
    }
}

