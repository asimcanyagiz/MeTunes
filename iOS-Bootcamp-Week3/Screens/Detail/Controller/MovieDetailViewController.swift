//
//  MovieDetailViewController.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    var movie: Movie? {
        didSet {
            title = movie?.trackName
            detailView.imageView.downloadImage(from: movie?.artworkLarge)
            detailView.releaseDate = movie?.releaseDate
            detailView.artistName = movie?.artistName
            detailView.country = movie?.country
            detailView.primaryGenreName = movie?.primaryGenreName
        }
    }
    
    private let detailView = MovieDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }
}
