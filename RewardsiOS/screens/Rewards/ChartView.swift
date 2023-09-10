//
//  ChartView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    let chatViewHeight = (UIScreen.screenHeight / 3)
    let totalSpent: Double
    let totalEarned: Double
    let totalBalance: Double
    
    init(totalSpent: Double, totalEarned: Double, totalBalance: Double) {
        self.totalSpent = totalSpent
        self.totalEarned = totalEarned
        self.totalBalance = totalBalance
    }
    
    
    
    
    var body: some View {
        
        HStack(alignment: .center) {
            PieChartView(data: PieChartData(dataSets: PieDataSet(
                dataPoints: [
                    PieChartDataPoint(value: totalSpent, description: "Spent",   colour: .blue  , label: .label(text: "Spent", colour: Color(BaseColours.darkGreen))),
                    PieChartDataPoint(value: totalEarned, description: "Earned",   colour: Color(BaseColours.darkGrey)   , label: .label(text: "Earned", colour: .white))
                ],
                legendTitle: "Rewards"), metadata: ChartMetadata(title: String(totalBalance), subtitle: "Available Balance"),
                                            chartStyle: PieChartStyle(infoBoxPlacement: .header)))
        }.frame(height: chatViewHeight ).padding().background(Color(BaseColours.primary)).cornerRadius(20).shadow(radius: 10).padding()
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(totalSpent: 40.00, totalEarned: 64.45, totalBalance: 24.45)
    }
}
