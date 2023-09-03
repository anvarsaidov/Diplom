//
//  APICallError.swift
//  ShopApp
//
//  Created by AnvarSaidov on 29.08.23.
//

import Foundation

enum APICallError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case noData
    case invalidResponse
    case decodingError
    
    var localizedDescription: String {
        switch self {
        case .apiError:
            return "Failed to get data"
            
        case .invalidEndpoint:
            return "Invalid endpoint"
            
        case .invalidResponse:
            return "Invalid response"
            
        case .noData:
            return "No data"
            
        case .decodingError:
            return "Failed to decode data"
        }
    }
}
