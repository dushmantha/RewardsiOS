//
//  APIConstant.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 9/09/23.
//

import Foundation

// API constants
enum APIConstants{
    static let baseUrl = "https://quotes.rest/"
}

// API error message
enum ServiceError: Error {
    case urlNotFound(String = "Missing URL")
    case statusNotOk(String = "Failed to find data.", statusCode: Int?)
    case decoderError(String = "Unable to decode data")
}

// API http method
enum HTTPMethod: String{
    case get = "GET"
}

// API last path
enum RelativePath : String{
    case rewards = "rewards.json"
}
