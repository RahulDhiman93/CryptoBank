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
    
    let cryp = CryptoNetwork()
    var currencyNames:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       self.ind.startAnimating()
          DispatchQueue.main.async {
           self.get_crptodata(){ (success,fail,names) in
            if success == false {
                return
            }
            else{
                DispatchQueue.main.async {
                    self.ind.stopAnimating()
                    self.currencyNames = names!
                    print("COUNT")
                    print(self.currencyNames.count)
                    self.tableView.reloadData()
                }
                
            }
          }
        }
        
        print(currencyNames)
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
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
        print("in arname")
        print(arName)
       cell.CurrencyTitle.text = arName
        return cell
}
    
    @IBAction func btn(_ sender: Any) {
        
        
        
    }
    
  
    
    func get_crptodata(_ completion: @escaping (_ done: Bool, _ error: String?,_ gotit: [String]?) -> Void){
        var cryp = CryptoNetwork()
       
        
        cryp.get_data(completion: {error,data in
            
            if error != nil{
                completion(false,error,nil)
                return
            }
            
            else{
                  DispatchQueue.main.async {
                    print("DONE")
             completion(true,nil,data!)
                    self.tableView.reloadData()
            }
            }
        })
        //print(array)
        
    }
}

