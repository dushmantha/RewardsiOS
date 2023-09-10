//
//  FetchRewardsService.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 9/09/23.
//

import Foundation

protocol FetchRewardsService {
    func fetchRewards() async throws ->[RewardsModel]
}

struct fetchRewardsServiceImplementation : FetchRewardsService {
    let router  = Router()
    
    /*
     Mathod : fetching rewards list
     Params : queryParam - nil
     return : Data decode from rewards list data response
     */
    func fetchRewards() async throws -> [RewardsModel] {
        guard let decodedResponse = try? await JSONDecoder().decode([RewardsModel].self, from: router.fetch(endPoint: .rewards, queryParam: nil))
        else { throw ServiceError.decoderError() }
        return decodedResponse
    }
}
