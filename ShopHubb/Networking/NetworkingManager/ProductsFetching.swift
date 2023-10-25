//
//  ProductsFetching.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import Foundation

// Added protocol to decouple
protocol ProductFetching {
    func fetchProducts(completed: @escaping (Result<[Products], ProductsFetchingError>) -> Void)
}

class NetworkingManager: ProductFetching {
    static let shared = NetworkingManager()
    
    func fetchProducts(completed: @escaping (Result<[Products], ProductsFetchingError>) -> Void) {
        let productsUrl = EndPoints.baseUrl.rawValue
        fetchData(fromUrl: productsUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let productResponse: ProductResponse = try decoder.decode(ProductResponse.self, from: data)
                    completed(.success(productResponse.products))
                } catch {
                    completed(.failure(.unableToParseData))
                }
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    private func fetchData(fromUrl urlString: String, completed: @escaping (Result<Data, ProductsFetchingError>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.urlSessionError))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.httpFailureResponseCode))
                return
            }
            guard let data = data else {
                completed(.failure(.noDataReceived))
                return
            }
            completed(.success(data))
        }
        task.resume()
    }
    
}
