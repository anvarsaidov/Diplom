//
//  APIService.swift
//  ShopApp
//
//  Created by AnvarSaidov on 20.08.23.
//

import UIKit

final class ApiService {
    
    static let shared = ApiService()
    
    private let baseUrl = "https://fakestoreapi.com/"
    private let session = URLSession.shared
    var errorMsg = ""
    
    func getRequestProduct(for endPointRequest: EndPointRequest, complition: @escaping ((String, Product) -> ())) {
        guard let url = URL(string: "\(baseUrl)\(endPointRequest.description)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let _ = session.dataTask(with: request) { data, respone, error in
            
            if error != nil {
                guard let error = error?.localizedDescription else { return }
                self.errorMsg = error
                DispatchQueue.main.async { [self] in
                    complition(self.errorMsg, [])
                }
            } else {
                self.errorMsg = ""
            }
            
            if let data = data,
               let _ = String(data: data, encoding: .utf8) {
                if let responce = try? JSONDecoder().decode(Product.self, from: data) {
                    DispatchQueue.main.async { [self] in
                        complition(errorMsg, responce)
                    }
                }
            }
        }.resume()
    }
    
    func getRequestImageProduct(for url: String, complition: @escaping ((UIImage) -> ())) {
        guard let url = URL(string: url) else { return }
        session.dataTask(with: url) { data, respone, error in
            if error != nil {
                guard let errorImage = UIImage(systemName: "wifi.slash") else { return }
                complition(errorImage)
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
