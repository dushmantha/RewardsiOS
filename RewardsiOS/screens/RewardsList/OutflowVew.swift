//
//  OutflowVew.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 9/09/23.
//

import SwiftUI

struct OutflowVew: View {
    let rewards: [RewardsModel]
    var body: some View {
        List(rewards, id: \.self){ reward in
            RewardRow(source: reward.source, date: reward.date)
        }
    }
}

struct OutflowVew_Previews: PreviewProvider {
    static var previews: some View {
        OutflowVew( rewards: RewardsModel.mockData)
    }
}
