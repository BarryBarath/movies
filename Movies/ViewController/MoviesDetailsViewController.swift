//
//  MoviesDetailsViewController.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import UIKit
import SDWebImage

class MoviesDetailsViewController: UIViewController {
    @IBOutlet weak var moviesImg: UIImageView!
    @IBOutlet var backImg: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var genericLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    
    var moviesDetails = MovieListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAction()
        // Do any additional setup after loading the view.
    }
    
    func setupAction() {
        
        backImg.addTap {
            self.navigationController?.popViewController(animated: true)
        }
        
        nameLbl.text! = moviesDetails.title
        let moviesimage = Constant.Imgkey.baseImgurl  + moviesDetails.poster_path
        moviesImg.sd_setImage(with: URL(string: moviesimage), placeholderImage: UIImage(named: "tree"))
        
        //MARK : DATE FORMAT SETUP :
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-dd"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM yyyy"
        let showDate = inputFormatter.date(from: moviesDetails.release_date)
        let resultString = outputFormatter.string(from: showDate!)


        dateLbl.text! =  Constant.MoviesDetailsKey.releasedate + resultString
        languageLbl.text! = Constant.MoviesDetailsKey.language + moviesDetails.original_language
        genericLbl.text! = Constant.MoviesDetailsKey.genres + moviesDetails.media_type
        ratingLbl.text! = Constant.MoviesDetailsKey.ratings + moviesDetails.vote_average.description + " & " + moviesDetails.vote_count.description + " votes"
        aboutLbl.text! = moviesDetails.overview
    }

}
