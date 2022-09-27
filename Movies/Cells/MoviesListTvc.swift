//
//  MoviesListTvc.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import UIKit

class MoviesListTvc: UITableViewCell {
    
    @IBOutlet weak var cornerVw: UIView!
    @IBOutlet weak var Movieimg: UIImageView!
    
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
