//
//  RewardsModel.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 9/09/23.
//

import Foundation

struct RewardsModel: Decodable, Hashable {
    let id : Int
    let date : String
    let source: String
    let amount: Double
    let isEarn: Bool
    
    
    // CodingKey isn't usefull in this case, as API return is expected format
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case source
        case amount
        case isEarn
    }
}

extension RewardsModel {
    static let mockData: [RewardsModel] = {
        [RewardsModel(id: 1, date: "20-09-23", source: "Promotion Bonus", amount: 123.45, isEarn: true), RewardsModel(id: 2, date: "20-09-23", source: "Referral Bonus", amount: 1223.45, isEarn: true), RewardsModel(id: 2, date: "20-09-23", source: "Product Purchase", amount: 123.45, isEarn: false)]
    }()
}
