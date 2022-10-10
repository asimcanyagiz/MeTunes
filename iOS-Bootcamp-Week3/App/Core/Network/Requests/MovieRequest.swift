//
//  MovieRequest.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 10.10.2022.
//

import Foundation
struct MovieRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "movie"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "movie") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> MovieResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(MovieResponse.self, from: data)
        return response
    }
}
