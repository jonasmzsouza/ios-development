//
//  ViewController.swift
//  MyMovies
//
//  Created by Jonas Muniz on 16/03/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var movie: Movie?
    
    // Creating datepicker to retrieve the date
    var datePicker = UIDatePicker()
    
    // Creating alert object
    var alert: UIAlertController!
    
    // Variable that will receive the movie trailer
    var trailer: String = ""
    
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling the loadTrailers method passing the movie title
        if let title = movie?.title {
            loadTrailers(title: title)
        }
        
        // Setting the datePicker minimum date for today
        datePicker.minimumDate = Date()
        
        // Adding method to be called when the DatePicker has its value changed
        datePicker.addTarget(self, action: #selector(changeDate), for: .valueChanged)
    }
    
    @objc func changeDate() {
        
        // Creating the dateFormatter to format the date
        let dateFormatter = DateFormatter()
        
        // Defining the style that the date will be presented
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm'h"
        
        // Retrieving data from datePicker to pass on to TextField
        alert.textFields?.first?.text = dateFormatter.string(from: datePicker.date)
        
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
    
    func loadTrailers(title: String) {
        
        // Calling the loadTrailers method of the API class and retrieving the first result from the list of results in the closure.
        API.loadTrailers(title: title) { (apiResult) in
            guard let results = apiResult?.results, let trailer = results.first else {return}
            
            //Taking the trailer url and assigning it to the variable trailer, doing it in the main thread.
            DispatchQueue.main.async {
                self.trailer = trailer.previewUrl
                print("Trailer URL:", trailer.previewUrl)
            }
        }
    }
    
    
    @IBAction func scheduleNotification(_ sender: UIButton) {
        
        // Creating AlertController as .alert
        alert = UIAlertController(title: "Reminder", message: "When do you want to be reminded to watch the movie?", preferredStyle: .alert)
        
        // Adding a TextField to the alert
        alert.addTextField { (textField) in
            textField.placeholder = "Reminder date"
            self.datePicker.date = Date()
            textField.inputView = self.datePicker
        }
        
        // Adding Schedule and Cancel buttons.
        // Defining the title and style to create an Action.
        let okAction = UIAlertAction(title: "Schedule", style: .default) { (action) in
            self.schedule()
        }
        
        // In an action that serves to cancel an action, the ideal is to use the .cancel style
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Adding actions to the alert
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        // Showing the alert to the user
        present(alert, animated: true, completion: nil)
    }
    
    // Schedule a notification
    func schedule() {
        
        // Creating the object that defines the content of the notification
        let content = UNMutableNotificationContent()
        
        // Defining the title, by title property
        content.title = "Reminder"
        
        // And the message, through the body property
        let movieTitle = movie?.title ?? ""
        content.body = "Watch the movie \"\(movieTitle)\""
        
        // Creating a DateComponents object that contains the elements that make up a date
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date)
        
        // Object that defines the condition for triggering the notification
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Reminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

