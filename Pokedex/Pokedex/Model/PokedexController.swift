//
//  PokedexController.swift
//  Pokedex
//
//  Created by Lambda_School_Loaner_101 on 9/16/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import Foundation

class PokedexController {
    
    private let baseURL = URL(string: "http://poke-api.vapor.cloud/")
    var pokedex: [Pokedex] = []
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    func searchForPokedex(with searchTerm: String, completion: @escaping () -> Void) {
        guard let baseURL = baseURL else {
            completion()
            return
        }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("request URL is nil")
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            guard let data = data else {
                print("No data returned from data task.")
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let pokedexSearch = try jsonDecoder.decode(PokedexSearch.self, from: data)
                self.pokedex = pokedexSearch.results
            } catch {
                print("Unable to decode data into PokedexSearch object: \(error)")
            }
            completion()
            }.resume()
    }
}



