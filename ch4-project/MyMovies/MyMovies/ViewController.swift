//
//  ViewController.swift
//  MyMovies
//
//  Created by Jonas Muniz on 16/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let movie = movie {
            ivMovie.image = movie.image as? UIImage
            lbTitle.text = movie.title
            lbCategories.text = movie.categories
            lbDuration.text = movie.duration
            lbRating.text = "⭐️ \(movie.rating)/10"
            tvSummary.text = movie.summary
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddEditViewController {
            vc.movie = movie
        }
    }
    
}

