//
//  RewardsViewModel.swift
//  RewardsiOSTests
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import XCTest

@testable import RewardsiOS

class MockDataRewards: FetchRewardsService {
    func fetchRewards() async throws -> [RewardsModel] {
        return RewardsModel.mockData
    }
}

class ErrorMockDataRewards: FetchRewardsService {
    func fetchRewards() async throws -> [RewardsModel] {
        throw URLError(.badServerResponse)
    }
}

final class RewardsViewModel: XCTestCase {
    
    var viewModel: RewardsView.RewardsViewModelImplementation!
    var errorViewModel : RewardsView.RewardsViewModelImplementation!

    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = RewardsView.RewardsViewModelImplementation(fetchRewardsService: MockDataRewards())
        errorViewModel = RewardsView.RewardsViewModelImplementation(fetchRewardsService: ErrorMockDataRewards())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        errorViewModel = nil
    }

    @MainActor  func testRewards() async throws {
        await viewModel.fetchRewards()
        XCTAssertEqual(viewModel.rewards?.count, 3)
    }
    
    @MainActor  func testErrorRewards() async throws {
        await errorViewModel.fetchRewards()
        XCTAssertNil(errorViewModel.rewards, " Fetching Rewards error handling failed")
        XCTAssertTrue(errorViewModel.error != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
