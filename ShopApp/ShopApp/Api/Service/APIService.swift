//
//  APIService.swift
//  ShopApp
//
//  Created by AnvarSaidov on 20.08.23.
//

import UIKit

protocol ApiServiceProtocol {
    func getRequestProduct(for endPointRequest: EndPointRequest, complition: @escaping ((String, Product) -> ()))
    func getRequestImageProduct(for url: String, complition: @escaping ((UIImage) -> ()))
}

final class ApiService: ApiServiceProtocol {
    
    static let shared = ApiService()
    private let baseUrl = "https://fakestoreapi.com/"
    private let session = URLSession.shared
    
    func getRequestProduct(for endPointRequest: EndPointRequest, complition: @escaping ((String, Product) -> ())) {
        guard let url = URL(string: "\(baseUrl)\(endPointRequest.description)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let _ = session.dataTask(with: request) { data, respone, error in
            if let data = data,
               let dataString = String(data: data, encoding: .utf8) {
                if let responce = try? JSONDecoder().decode(Product.self, from: data) {
                    DispatchQueue.main.async {
                        complition(dataString, responce)
                    }
                }
            }
        }.resume()
    }
    
    func getRequestImageProduct(for url: String, complition: @escaping ((UIImage) -> ())) {
        guard let url = URL(string: url) else { return }
        session.dataTask(with: url) { data, respone, error in
            if let error = error {
                print(error)
            } else {
                if let data = data,
                   let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        complition(image)
                    }
                }
            }
        }.resume()
    }
}
