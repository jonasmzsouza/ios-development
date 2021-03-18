//
//  UIViewController+CoreData.swift
//  MyMovies
//
//  Created by Jonas Muniz on 18/03/21.
//

import UIKit
import CoreData

extension UIViewController {
    
    // This computed variable will give us access to NSManagerObjectContext from any screen
    var context: NSManagedObjectContext {
        
        // Creating a reference to AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Through the .viewContext property present in persistentContainer,
        // it is possible to access the NSManagedObjectContext. Return only that property.
        return appDelegate.persistentContainer.viewContext
        
    }
}
