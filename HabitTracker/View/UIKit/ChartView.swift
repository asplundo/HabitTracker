import Foundation
import SwiftUI
import Charts

struct ChartView: UIViewRepresentable {
    
    var completeDates: [Date]
    
    func updateUIView(_ view: BarChartView, context: UIViewRepresentableContext<ChartView>) {
        print("nedds update")
                let calendar = Calendar.current
        
        let weekNumbers = completeDates.map { calendar.component(.weekOfYear, from: $0) }
        
        let grouped = weekNumbers.reduce(into: [:]) { result, num in
            result[num, default: 0] += 1
        }
        
        var dataEntries: [BarChartDataEntry] = []
        for (key, value) in grouped {
            let dataEntry = BarChartDataEntry(x: Double(key), y: Double(value))
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Progress")
        chartDataSet.colors = ChartColorTemplates.joyful()
        let chartData = BarChartData(dataSet: chartDataSet)
        view.data = chartData
    }
    
    
    func makeUIView(context: Context) -> BarChartView {
        let view = BarChartView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        view.xAxis.granularity = 1
        view.leftAxis.granularity = 1
        view.rightAxis.enabled = false
        
        return view
    }
}
