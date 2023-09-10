//
//  InflowView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 9/09/23.
//

import SwiftUI

struct InflowView: View {
    
    let rewards: [RewardsModel]
    var body: some View {
        VStack {
            List(rewards, id: \.self){ reward in
                RewardRow(source: reward.source, date: reward.date)
            }
        }
    }
}

struct InflowView_Previews: PreviewProvider {
    static var previews: some View {
        InflowView(rewards: RewardsModel.mockData)
    }
}
