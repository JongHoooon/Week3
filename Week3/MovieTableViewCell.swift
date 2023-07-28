//
//  MovieTableViewCell.swift
//  Week3
//
//  Created by JongHoon on 2023/07/28.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie: Movie?
    
    @IBOutlet weak private var movieImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var infoLabel: UILabel!
    @IBOutlet weak private var overviewLabel: UILabel!
    
    func configureCell(row movie: Movie) {
        self.movie = movie
        movieImageView.image = UIImage(named: movie.title)
        titleLabel.text = movie.title
        let infoText: String = [
            movie.releaseDate,
            "\(movie.runtime)분",
            "\(movie.rate)점"
        ].joined(separator: " | ")
        infoLabel.text = infoText
        overviewLabel.text = movie.overview
    }
}
