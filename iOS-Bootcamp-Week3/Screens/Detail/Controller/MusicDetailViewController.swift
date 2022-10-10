//
//  MusicDetailViewController.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import UIKit

final class MusicDetailViewController: UIViewController {

    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.country = music?.country
            detailView.primaryGenreName = music?.primaryGenreName
        }
    }
    
    private let detailView = MusicDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
}
