//
//  CurrencyViewController.swift
//  CryptoBank
//
//  Created by Rahul Dhiman on 30/01/18.
//  Copyright © 2018 Rahul Dhiman. All rights reserved.
//

import UIKit
import SwiftCharts

class CurrencyViewController: UIViewController {

    @IBOutlet weak var graph: UIView!
    var chartView: BarsChart!
    
    var changearray:[String] = []
    
    var onehour:String = ""
    var twenty4hour:String = ""
    var oneweek:String = ""
    
    @IBOutlet weak var rank1: UITextView!
    @IBOutlet weak var price1: UITextView!
    @IBOutlet weak var change1h: UITextView!
    @IBOutlet weak var change24h: UITextView!
    @IBOutlet weak var change7day: UITextView!
    @IBOutlet weak var priceBTC: UITextView!
    @IBOutlet weak var supply: UITextView!
    @IBOutlet weak var totalsupply: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.roundedcorner(10, true)

        onehour = changearray[0]
        twenty4hour = changearray[1]
        oneweek = changearray[2]
        
        self.chart()
        
        self.change1h.textAlignment = .center
        
        self.change1h.text =  changearray[0] + "$"
        self.change24h.text =  changearray[1] + "$"
        self.change7day.text =  changearray[2] + "$"
        // Do any additional setup after loading the view.
    }
    
    
    func roundedcorner(_ cor:CGFloat,_ bound:Bool){
        self.rank1.layer.cornerRadius = cor
        self.price1.layer.cornerRadius = cor
        self.change1h.layer.cornerRadius = cor
        self.change24h.layer.cornerRadius = cor
        self.change7day.layer.cornerRadius = cor
        self.priceBTC.layer.cornerRadius = cor
        self.supply.layer.cornerRadius = cor
        self.totalsupply.layer.cornerRadius = cor
        
        self.rank1.clipsToBounds = bound
        self.price1.clipsToBounds = bound
        self.change1h.clipsToBounds = bound
        self.change24h.clipsToBounds = bound
        self.change7day.clipsToBounds = bound
        self.priceBTC.clipsToBounds = bound
        self.supply.clipsToBounds = bound
        self.totalsupply.clipsToBounds = bound
    }
    
    
    func chart(){
        
        var intonehour = Double(onehour)
        var double24hour = Double(twenty4hour)
        var doubleweek = Double(oneweek)
        
       
        
        
        if intonehour! < 0.0{
            
            //flag1 = 1
            intonehour = -intonehour!
        }
        
        if double24hour! < 0.0{
          //  flag2 = 1
            double24hour = -double24hour!
        }
        
        if doubleweek! < 0.0{
          //  flag3 = 1
            doubleweek = -doubleweek!
        }
        
        
       let chartConfig1 = BarsChartConfig(
        valsAxisConfig: ChartAxisConfig(from:0.0 ,to: 40.0,by: 2.0)
        )
        
        let frame1 = CGRect (x:0 ,y:30, width: self.graph.frame.width, height: (self.graph.frame.height))
        
        
       
        
        let chart = BarsChart(
            frame: frame1,
            chartConfig: chartConfig1,
            xTitle: "Time-Period",
            yTitle: "Change in U.S Dollars",
            bars:[
                ("1-H",intonehour!),
                ("24-H",double24hour!),
                ("7-D",doubleweek!)
            ],
            color: UIColor.black,
            barWidth: 40
        )
        
        self.graph.addSubview(chart.view)
        
        self.chartView = chart
    }
    
    
    
}
