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
    

    @IBAction func btAddPoster(_ sender: UIButton) {
        
        // Creating actionSheet alert
        let alert = UIAlertController(title: "Select poster", message: "Where do you want to choose the poster?", preferredStyle: .actionSheet)
        
        // Check if the camera is available on the device.
        // Obs .: It is not possible to access the camera through the simulator.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                self.selectPicture(source: .camera)
            }
            alert.addAction(cameraAction)
        }
        
        // Creating the actions to open the Photo Library and Photo Album
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.selectPicture(source: .photoLibrary)
        }
        alert.addAction(libraryAction)
        let photosAction = UIAlertAction(title: "Photo Album", style: .default) { (action) in
            self.selectPicture(source: .photoLibrary)
        }
        alert.addAction(photosAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // Showing the alert
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture(source: UIImagePickerController.SourceType) {
        
        // Creating UIImagePickerController object
        let imagePicker = UIImagePickerController()
        
        // Defining sourceType based on the parameter
        imagePicker.sourceType = source
        
        // Defining this class as the object's delegate
        imagePicker.delegate = self
        
        // Introducing the user
        present(imagePicker, animated: true, completion: nil)
    }
    
}


extension AddEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Safely retrieving the image via the UIImagePickerControllerOriginalImage key
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
    
            // Recovering the original width and height to define the aspect ratio of the image
            // so that it can be reduced, leaving 800 pixels in size on its larger side.
            let aspectRatio = image.size.width / image.size.height
            var smallSize: CGSize
            if aspectRatio > 1 {
                smallSize = CGSize(width: 800, height: 800/aspectRatio)
            } else {
                smallSize = CGSize(width: 800*aspectRatio, height: 800)
            }
            
            // The codes below are necessary to create a reduced version of the image
            UIGraphicsBeginImageContext(smallSize)
            image.draw(in: CGRect(x: 0, y: 0, width: smallSize.width, height: smallSize.height))
            let smallImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            // Assigning the small image to our ImageView
            ivMovie.image = smallImage
            
            // Closing the ImagePicker
            dismiss(animated: true, completion: nil)
        }
    }
}
