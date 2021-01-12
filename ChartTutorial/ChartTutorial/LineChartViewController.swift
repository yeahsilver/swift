//
//  LineChartViewController.swift
//  ChartTutorial
//
//  Created by 허예은 on 2021/01/10.
//

import UIKit
import Charts

class LineChartViewController: UIViewController, IValueFormatter {
    @IBOutlet weak var LineChartView: LineChartView!
    
    var date: [String]!
    var value: [Double]!
    weak var axisFormatDelegate : IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        axisFormatDelegate     = self
        LineChartView.delegate = self
        
        designLineChart()
        
//        date = ["1월 4일", "1월 5일", "1월 6일", "1월 7일", "1월 8일", "1월 9일", "1월 10일"]
        date = ["1.4", "1.5", "1.6", "1.7", "1.8", "1.9", "1.10"]
        value = [55.3, 55.4, 55.1, 55.0, 54.8, 55.1, 55.2]
        
       
        
        var dataEntries = [ChartDataEntry]()
        
        
        for i in 0..<value.count {
            let dataEntry = ChartDataEntry(x: Double(i) , y: value[i])
            dataEntries.append(dataEntry)
        }
        
        let line = LineChartDataSet(entries: dataEntries)
        line.mode = .cubicBezier
        line.valueFont = UIFont(name: "Verdana", size: 10)!
        line.label = " "
        line.colors = [UIColor(red: 122/255, green: 111/255, blue: 225/255, alpha: 1)]
        line.setCircleColor(UIColor(red: 122/255, green: 111/255, blue: 225/255, alpha: 1))
        line.circleRadius = 5
        line.drawIconsEnabled                       = false
        line.drawCircleHoleEnabled                  = false
        line.valueFormatter                         = self
        line.drawVerticalHighlightIndicatorEnabled  = false
        line.drawHorizontalHighlightIndicatorEnabled = false
        line.highlightColor = UIColor(red: 122/255, green: 111/255, blue: 225/255, alpha: 1)
        
        let marker = BalloonMarker(color:UIColor(red: 122/255, green: 111/255, blue: 225/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        marker.arrowSize = CGSize(width: 0, height: 0)
        marker.chartView = LineChartView
        marker.minimumSize = CGSize(width: 20, height: 10)
        LineChartView.marker = marker
        	
        let data = LineChartData()
        data.addDataSet(line)
        
        LineChartView.data = data
        LineChartView.doubleTapToZoomEnabled = false
        LineChartView.dragEnabled = false
        
        let xAxis = LineChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.labelTextColor = .lightGray
        xAxis.labelPosition = .bottom
        xAxis.setLabelCount(date.count, force: false)
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
        xAxis.setLabelCount(value.count, force: false)
      
        let leftAxis = LineChartView.leftAxis
        leftAxis.drawGridLinesEnabled = true
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawLabelsEnabled = false
        leftAxis.granularityEnabled = false
        // leftAxis.axisLineDashPhase = CGFloat(1)
        
        let rightAxis = LineChartView.rightAxis
        rightAxis.enabled = false
        
        let ll = ChartLimitLine(limit: 55.0, label: "")
        ll.lineColor = UIColor(red: 122/255, green: 111/255, blue: 225/255, alpha: 1)
        ll.lineDashLengths = [5, 5]
        ll.lineWidth = 1.0
        
        LineChartView.leftAxis.addLimitLine(ll)
        
        LineChartView.legend.form = .none
    }
    
    func designLineChart(){
        designIfNoData()
        
    }
    
    func designIfNoData(){
        LineChartView.noDataText = "데이터가 존재하지 않습니다."
        LineChartView.noDataFont = .systemFont(ofSize: 20)
        LineChartView.noDataTextColor = .lightGray
    }
    
    
}

extension LineChartViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let formatter = String(format: "%.1f", value)
        return "\(formatter)"
    }
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        let formatter = String(format: "%.1f", value)
        return "\(formatter)"
    }
}

extension LineChartViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {

        
    }
}
