//
//  MovieTableViewController.swift
//  Week3
//
//  Created by JongHoon on 2023/07/28.
//

import UIKit

final class MovieTableViewController: UITableViewController {
    
    private let movies = MovieInfo.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 200.0
    }
}

extension MovieTableViewController {

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return movies.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        let row = movies[indexPath.row]
        cell.configureCell(row: row)
        
        return cell
    }
   
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
