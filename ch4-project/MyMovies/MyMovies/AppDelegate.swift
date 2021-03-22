//
//  AppDelegate.swift
//  MyMovies
//
//  Created by Jonas Muniz on 16/03/21.
//

import UIKit
import CoreData
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Defining the UNUserNotificationCenter delegate as this class itself.
        // With that, this class will answer for the UNUserNotificationCenter.
        UNUserNotificationCenter.current().delegate = self
        
        // Requesting that the current setting be provided, that is, what the user responded to when asking for permission.
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            // If the authorization status is notDetermined, it means that the user has never been asked to accept
            // (that is, it is the first time the app is opened). In that case, we will ask for permission.
            if settings.authorizationStatus == .notDetermined {
                
                // First, an options file is created indicating what our notification will do.
                // In our case, we will show the notification alert and play a sound.
                let options: UNAuthorizationOptions = [.alert, .sound]
                
                // Requesting authorization through the requestAuthorization method.
                UNUserNotificationCenter.current().requestAuthorization(options: options, completionHandler: { (success, error) in
                    
                    // The success property indicates whether the user has authorized it or not.
                    if error == nil {
                        print(success)
                    } else {
                        print(error!.localizedDescription)
                    }
                    
                })
            
            // Always printing the message if the user has denied it.
            } else if settings.authorizationStatus == .denied {
                print("User denied notification")
            }
        }
        return true
    }
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "MyMovies")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Method called when notification will appear with the app open
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    // Method called when the notification will appear with the app closed or in the background
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
