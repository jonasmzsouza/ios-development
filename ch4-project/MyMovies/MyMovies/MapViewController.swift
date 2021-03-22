//
//  MapViewController.swift
//  MyMovies
//
//  Created by Jonas Muniz on 21/03/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        // Asking the map to show the user's location
        mapView.showsUserLocation = true
        
        // Defining that the map will track the user's location through the userTrackingMode property, thus centralizing where he is.
        mapView.userTrackingMode = .follow
        
        mapView.delegate = self
        
        requestAuthorization()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SiteViewController {
            vc.site = sender as! String
        }
    }
    
    func requestAuthorization() {
        
        // Defining location accuracy. The kCLLocationAccuracyBest constant provides the highest possible accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Method requesting authorization
        locationManager.requestWhenInUseAuthorization()
    }
    
    func showRoute(to destination: CLLocationCoordinate2D) {
        // Route request object
        let request = MKDirections.Request()
        
        // Configuring source and destination.
        // Note that these objects are of the MKMapItem type, and to create a MKMapItem it is necessary to create an MKPlacemark,
        // which can be created from a coordinate.
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        
        // The object that calculates the route is MKDirections
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            if error == nil {
                
                // Unwrapping the response and retrieving the first route from the list of routes present in the response
                guard let response = response, let route = response.routes.first else {return}
                
                // It is possible to retrieve a series of information about the route, such as name, distance, time, etc.
                print("Name:", route.name, "- distance:", route.distance, "- duration:", route.expectedTravelTime)
                
                // In addition, it is possible to retrieve all steps of the route
                for step in route.steps {
                    print("In", step.distance, "meters, ", step.instructions)
                }
                
                // Before adding the overlay, we need to remove any other route shown
                self.mapView.removeOverlays(self.mapView.overlays)
                // Adding the route on the map. This is done using an overlay
                // The polyline property gives us the polygonal line that represents the route
                // Placing the route over the streets and below the street names
                self.mapView.addOverlays([route.polyline], level: .aboveRoads)
            }
        }
    }
}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Taking focus away from the Search Bar to hide the keyboard
        searchBar.resignFirstResponder()
        
        // Object that sets the search parameters
        let request = MKLocalSearch.Request()
        
        // The naturalLanguageQuery property contains the text that will be used in the search
        request.naturalLanguageQuery = searchBar.text
        
        // Defining the region to be used to search for points of interest
        request.region = mapView.region
        
        // Creating the object to perform the search
        let search = MKLocalSearch(request: request)
        
        // Performing the search using the start method
        search.start { (response, error) in
            if error == nil {
                // Retrieving the requested elements if there is no error
                guard let response = response else {return}
                
                // Removing all annotations on the map
                self.mapView.removeAnnotations(self.mapView.annotations)
                
                // The response object has a property called mapItems containing all the locations found for the search
                for item in response.mapItems {
                    
                    // Creating an annotation
                    let annotation = MKPointAnnotation()
                    
                    // Defining the coordinate, title and subtitle
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    annotation.subtitle = item.url?.absoluteString
                    
                    // Adding the annotation to the map
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Using the corresponding renderer if the overlay is an MKPolyline
        if overlay is MKPolyline {
            //Criando um renderer para polylines
            let renderer = MKPolylineRenderer(overlay: overlay)
            
            // Defining its thickness and color
            renderer.lineWidth = 8.0
            renderer.strokeColor = .blue
            
            return renderer
        } else {
            return MKOverlayRenderer(overlay: overlay)
        }
    }
    
    // Method called when an Annotation View is selected
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        // Retrieving annotation and name
        guard let annotation = view.annotation, let name = annotation.title else {return}
        
        let alert = UIAlertController(title: name, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // If there is a subtitle, add action to go to the site
        if let subtitle = annotation.subtitle, let url = subtitle {
            let urlAction = UIAlertAction(title: "Access website", style: .default) { (action) in
                // Go to website
                self.performSegue(withIdentifier: "webSegue", sender: url)
            }
            alert.addAction(urlAction)
        }
        
        // Action to trace the route
        let routeAction = UIAlertAction(title: "Plot route", style: .default) { (action) in
            
            // Calling method that will show the route
            self.showRoute(to: annotation.coordinate)
        }
        alert.addAction(routeAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
