//
//  Music.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import Foundation

struct Music: Decodable {
    let artistName: String?
    let trackName: String?
    let artworkUrl100: URL?
    let trackCount: Int?
    let country: String?
    let primaryGenreName: [String]?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkUrl100 = "artworkUrl100"
        case trackCount
        case country
        case primaryGenreName
    }
}
