//
//  MoviesListViewController.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import UIKit
import WebKit

class MoviesListViewController: UIViewController {
    
    //MARK: - CONSTRAINTS :
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTbl: UITableView!
    
    //MARK: - PROPERTIES
    var moviesListVm = MoviesViewModel()
    var moviesLists = [MovieListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        moviesList()
    }
}

extension MoviesListViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - NUMBER OF COUNTS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.moviesLists.isEmpty {
            return 0
        } else {
            return self.moviesLists.count
        }
    }
    
    //MARK: - ASSIGN VALUES
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListTvc", for: indexPath) as! MoviesListTvc
        
        let details = self.moviesLists[indexPath.row]
        let moviesimage = Constant.Imgkey.baseImgurl  + details.poster_path
        cell.Movieimg.sd_setImage(with: URL(string: moviesimage), placeholderImage: UIImage(named: "tree"))
        cell.nameLbl.text! = details.title
        cell.ratingLbl.text! = details.vote_average.description

        //MARK: - TOUCH ACTION :
        
        cell.contentView.addTap {
            let moviesDetailVc = MoviesDetailsViewController.instantiate(fromAppStoryboard: .main)
            moviesDetailVc.moviesDetails = details
            self.navigationController?.pushViewController(moviesDetailVc, animated: true)
        }
        return cell
        
    }
}
extension MoviesListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search Text \(searchText)")
        if searchText.count >= 3 {
            let filtered = self.moviesLists.filter { $0.title.contains(searchText)}
            moviesLists = filtered
            self.moviesTbl.reloadData()
            print("filter valuess::\(filtered)")
        } else {
            moviesList()
        }
    }
}
extension MoviesListViewController {
    func moviesList() {
        moviesListVm.moviesList()
        moviesListVm.successHandler = { (data) in
            print("SUCCESS::\(data)")
            self.moviesLists = data.moviesList
            self.moviesTbl.reloadData()
        }
        moviesListVm.errorHandler = { (error) in
            Toaster.instance.showToast(msg: error)
        }
    }
}


struct Constant {
    
    struct  Imgkey {
        static let  baseImgurl = "https://image.tmdb.org/t/p/w500"
    }
    
    struct MoviesDetailsKey  {
        
        static let duration = "Duration: "
        static let releasedate = "Release Date: "
        static let language = "Languages: "
        static let genres = "Genres: "
        static let ratings = "Rating: "
        
    }
    
}
