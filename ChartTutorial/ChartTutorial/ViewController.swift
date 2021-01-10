//
//  ViewController.swift
//  ChartTutorial
//
//  Created by 허예은 on 2021/01/10.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    var date: [String]!
    var value: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date=["1.3","1.4","1.5","1.6","1.7","1.8","1.9","1.10"]
        value = [55.3, 55.6, 55.7, 56.1, 55.4, 55.3, 53.3]
        
        setChart(dataPoints: date, value: value)
    }
    
    func setChart(dataPoints: [String], value: [Double]){
        barChartView.noDataText = "데이터가 존재하지 않습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        
        var dataEntries: [BarChartDataEntry] = []
        
        let length = dataPoints.count
        
        for i in 0..<length-1 {
            let dataEntry = BarChartDataEntry(x: Double(i), y: value[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "몸무게")
        chartDataSet.colors = [.purple]
        chartDataSet.highlightEnabled = false
        
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        barChartView.doubleTapToZoomEnabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        barChartView.rightAxis.enabled = false
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
        
        let ll = ChartLimitLine(limit: 55.0, label: "목표 몸무게")
        barChartView.leftAxis.addLimitLine(ll)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LineChart") as! LineChartViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
}

