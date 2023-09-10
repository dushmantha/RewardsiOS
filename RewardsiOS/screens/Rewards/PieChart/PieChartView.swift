//
//  PieChartView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI
import SwiftUICharts

struct PieChartView: View {
    
    var data: PieChartData
    
    var body: some View {
        VStack {
            PieChart(chartData: data)
                .touchOverlay(chartData: data)
                .headerBox(chartData: data)
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())])
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
                .id(data.id)
                .padding(.horizontal)
        }
    }
}

struct PieChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        
        let data = PieDataSet(
            dataPoints: [
                PieChartDataPoint(value: 7, description: "One",   colour: .blue  , label: .icon(systemName: "1.square", colour: .white, size: 30)),
                PieChartDataPoint(value: 2, description: "Two",   colour: .red   , label: .icon(systemName: "2.square", colour: .white, size: 30)),
            ],
            legendTitle: "Data")
        
        
        PieChartView(data: PieChartData(dataSets: data,
                                  metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
                                  chartStyle: PieChartStyle(infoBoxPlacement: .header)))
    }
}
