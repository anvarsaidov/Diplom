//
//  APIService.swift
//  ShopApp
//
//  Created by AnvarSaidov on 20.08.23.
//

import UIKit

protocol ApiServiceProtocol {
    func getRequestProducts(for endPointRequest: EndPointRequest, complition: ((String, Product) -> ())?)
    func getRequestImageProduct(for url: String, complition: ((UIImage) -> ())?)
}

final class ApiService: ApiServiceProtocol {
    
    static let shared = ApiService()
    private let baseUrl = "https://fakestoreapi.com/products"
    private let session = URLSession.shared
    
    func getRequestProducts(for endPointRequest: EndPointRequest, complition: ((String, Product) -> ())?) {
        guard let url = URL(string: "\(baseUrl)\(endPointRequest.description)") else { return }
        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = "GET"
        let _ = session.dataTask(with: request) { data, respone, error in
            if let data = data,
               let dataString = String(data: data, encoding: .utf8) {
                if let responce = try? JSONDecoder().decode(Product.self, from: data) {
                    DispatchQueue.main.async {
                        complition?(dataString, responce)
                    }
                }
            }
        }.resume()
    }
    
    func getRequestImageProduct(for url: String, complition: ((UIImage) -> ())?) {
        guard let url = URL(string: url) else { return }
        session.dataTask(with: url) { data, respone, error in
            if let error = error {
                print(error)
            } else {
                if let data = data,
                   let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        complition?(image)
                    }
                }
            }
        }.resume()
    }
}

enum APICallError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case noData
    case invalidResponse
    case decodingError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to get data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .decodingError: return "Failed to decode data"
        }
    }
}

enum EndPointRequest: String, CaseIterable {
    
    case all = "All"
    case jewelery = "Jewelery"
    case electronics = "Electronics"
    case men = "Men's clothing"
    case women = "Women's clothing"
    
    var description: String {
        switch self {
        case .all: return "/"
        case .jewelery: return "/category/jewelery"
        case .electronics: return "/category/electronics"
        case .men: return "/category/men's%20clothing"
        case .women: return "/category/women's%20clothing"
        }
    }
}

