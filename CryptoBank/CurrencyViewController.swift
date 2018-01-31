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
    
    var onehour:String = "31.2"
    var twenty4hour:String = "-1.2"
    var oneweek:String = "16.2"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.chart()
        // Do any additional setup after loading the view.
    }
    
    
    func chart(){
        
        var intonehour = Double(onehour)
        var double24hour = Double(twenty4hour)
        var doubleweek = Double(oneweek)
        
        if intonehour! < 0.0{
            
            intonehour = -intonehour!
        }
        
        if double24hour! < 0.0{
            
            double24hour = -double24hour!
        }
        
        if doubleweek! < 0.0{
            
            doubleweek = -doubleweek!
        }
        
        
       let chartConfig1 = BarsChartConfig(
        valsAxisConfig: ChartAxisConfig(from:0.0 ,to: 50.0,by: 2.0)
        )
        
        let frame1 = CGRect (x:0 ,y:0, width: self.graph.frame.width, height: (self.graph.frame.height+10))
        
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
            color: UIColor.darkGray,
            barWidth: 40
        )
        
        self.graph.addSubview(chart.view)
        self.chartView = chart
    }
    
    
    
}
