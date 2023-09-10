//
//  RewardsView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 6/09/23.
//

import SwiftUI

struct RewardsView: View {
    @StateObject var rewardsViewModel = RewardsViewModelImplementation(fetchRewardsService: fetchRewardsServiceImplementation())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    VStack {
                        NavigationBar(title: Text(NSLocalizedString("rewards_navigation_bar_title",tableName: "Rewards", comment: "Rewards screen"))
                                      ,leadingContent: {
                            BarButton(barButtonType: nil)
                        },trailingContent: {
                            BarButton(barButtonType: nil)
                        },backgroundColor: BaseColours.primary, titleColor: BaseColours.darkGrey)
                    }
                    ProfileDetailsView()
                    
                    if let rewardsList = rewardsViewModel.rewards {
                        let totalSpent = rewardsViewModel.getTotalAmount(rewards: rewardsList, isEarned: false)
                        
                        let totalEarned = rewardsViewModel.getTotalAmount(rewards: rewardsList, isEarned: true)
                        
                        let totalBalance = totalEarned - totalSpent
                        
                        ChartView(totalSpent: totalSpent, totalEarned: totalEarned , totalBalance: totalBalance)
                        
                        
                       if let outflow = rewardsViewModel.filterListRewardsFrom(isEarned: false, rewardList: rewardsList) {
                           NavigationLink(destination: OutflowVew(rewards: outflow)) {
                               ButtonsContainer(buttonTitle: "Outflow", buttonSubTitle: String(totalSpent))
                           }
                       }
                       
                       if let inflow = rewardsViewModel.filterListRewardsFrom(isEarned: true, rewardList: rewardsList) {
                           NavigationLink(destination: InflowView(rewards: inflow)
                           ) {
                               ButtonsContainer(buttonTitle: "Inflow", buttonSubTitle: String(totalEarned))
                           }
                       }
                    }
                }.task {
                    await rewardsViewModel.fetchRewards()
                }.refreshable {
                    await rewardsViewModel.fetchRewards()
                }
            }
            
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}
