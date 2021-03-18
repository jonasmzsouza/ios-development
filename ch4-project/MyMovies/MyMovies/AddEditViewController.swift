//
//  AddEditViewController.swift
//  MyMovies
//
//  Created by Jonas Muniz on 18/03/21.
//


import UIKit

class AddEditViewController: UIViewController {
    
    // Variable that will receive the selected movie.
    var movie: Movie?
    
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfCategories: UITextField!
    @IBOutlet weak var tfDuration: UITextField!
    @IBOutlet weak var tfRating: UITextField!
    @IBOutlet weak var tvSummary: UITextView!
    @IBOutlet weak var btAddEdit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            ivMovie.image = movie.image as? UIImage
            tfTitle.text = movie.title
            tfCategories.text = movie.categories
            tfDuration.text = movie.duration
            tfRating.text = "\(movie.rating)"
            tvSummary.text = movie.summary
            btAddEdit.setTitle("Change", for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func addEditMovie(_ sender: UIButton) {
        // If the movie is null it is a sign that we are creating a movie and therefore we are going to instantiate a new Movie.
        // As it is a CoreData class, we instantiate it by passing the context.
        if movie == nil {
            movie = Movie(context: context)
        }
        
        // We pass the values ​​of the fields to the movie
        movie?.title = tfTitle.text
        movie?.categories = tfCategories.text
        movie?.duration = tfDuration.text
        movie?.rating = Double(tfRating.text!) ?? 0
        movie?.image = ivMovie.image
        movie?.summary = tvSummary.text
        
        do {
            // The method below saves any changes that occurred in the context, that is, changes the movie or records a new one.
            try context.save()
            
            // The command below asks the Navigaton Controller to return to the previous screen.
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
