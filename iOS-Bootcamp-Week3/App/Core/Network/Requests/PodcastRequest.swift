//
//  PodcastRequest.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import Foundation

struct PodcastRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "podcast"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "Podcast") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> PodcastResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(PodcastResponse.self, from: data)
        return response
    }
}
