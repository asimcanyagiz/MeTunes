//
//  Movie.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import Foundation

struct Movie: Decodable {
    let artistName: String?
    let trackName: String?
    let artworkUrl100: URL?
    let releaseDate: String?
    let country: String?
    let primaryGenreName: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkUrl100 = "artworkUrl100"
        case releaseDate
        case country
        case primaryGenreName
    }
}
