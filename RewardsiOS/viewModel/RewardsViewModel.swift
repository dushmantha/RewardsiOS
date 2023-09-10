//
//  RewardsViewModel.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 9/09/23.
//

import Foundation

protocol RewardsViewModel : ObservableObject {
    func fetchRewards() async
    nonisolated func filterListRewardsFrom(isEarned: Bool, rewardList: [RewardsModel]) -> [RewardsModel]?
    nonisolated func getTotalAmount(rewards: [RewardsModel]?, isEarned: Bool) -> Double
}

extension RewardsView{
    @MainActor
    final class RewardsViewModelImplementation : RewardsViewModel {
        
        @Published private(set) var rewards: [RewardsModel]?
        @Published private(set) var error: Error?
        private let fetchRewardsService : FetchRewardsService
        
        // dependency injection
        init(fetchRewardsService: FetchRewardsService){
            self.fetchRewardsService = fetchRewardsService
        }
        
        /*
         Mathod : Fetching reward list - protocol
         Params : nil
         return : nil
         */
        
        func fetchRewards() async  {
            do{
                let rewards = try await fetchRewardsService.fetchRewards()
                self.rewards = rewards
            } catch{
                rewards = RewardsModel.mockData
                debugPrint("Error loading : \(String(describing: error))")
                self.error = error
            }
        }
        
        nonisolated func getTotalAmount(rewards: [RewardsModel]?, isEarned: Bool) -> Double {
            guard let rewards = rewards, !rewards.isEmpty else {
                return 0
            }
            let filterList = filterListRewardsFrom(isEarned: isEarned, rewardList: rewards)
            guard let filterList = filterList, !filterList.isEmpty else {
                return 0
            }

            let totalAmount = filterList.map { $0.amount }.reduce(0, +)
            return totalAmount
        }
        
        nonisolated func filterListRewardsFrom(isEarned: Bool, rewardList: [RewardsModel]) -> [RewardsModel]? {
            return rewardList.filter {
                $0.isEarn == isEarned
            }
        }
    }
}
