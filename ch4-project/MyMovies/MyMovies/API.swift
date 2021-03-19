//
//  API.swift
//  MyMovies
//
//  Created by Jonas Muniz on 18/03/21.
//

import Foundation
struct APIResult: Codable {
    let results: [Trailer]
}
struct Trailer: Codable {
    let previewUrl: String
}

class API {
    // This object will contain the base address for our API. At the end of this URL we will add the name of the movie
    static let basePath = "https://itunes.apple.com/search?media=movie&entity=movie&term="
    
    // Here we are creating our URLSessionConfiguration object, using the default mode
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        // We will allow the use of connections over cellular networks
        config.allowsCellularAccess = true
        
        // Below, we assign the Content-Type header to our config.
        // With that, we are saying that our request works with content in JSON format
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        // We limit the response time to 45 seconds
        config.timeoutIntervalForRequest = 45.0
        
        // A maximum of 5 connections can be made
        config.httpMaximumConnectionsPerHost = 5
        
        return config
    }()
    
    // We created the URLSession object, passing the configuration file as a parameter.
    // Note that we don't use any of the singletons (.default, .efhemeral, .background)
    static let session = URLSession(configuration: configuration)
    
    // If we wanted to use a simpler session, with default settings, we could use the option below
    // static let session = URLSession.shared
    
    // This method will read all the information regarding the title of the past film.
    // Note that we are working with class methods (static methods)
    static func loadTrailers(title: String, onComplete: @escaping (APIResult?) -> Void) {
        
        // The line below formats the title so that it can be used in the calling URL,
        // as we know that URLs cannot contain spaces or special characters.
        guard let encodedTitle = (title).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              
              // Combining the basePath with the movie title
              let url = URL(string: basePath+encodedTitle) else {
            onComplete(nil)
            return
        }
        
        // We are using the dataTask method that accepts as parameters the url with the route
        // that will be called and the closure that will be executed bringing us all the information from the request,
        // such as the Data object, the response (URLResponse) and the error if it occurred
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
                onComplete(nil) // If an error has occurred, we will return nil to onComplete
            } else {
                // We cast URLResponse to HTTPURLResponse because we expect an HTTP response
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil) // We did not get a valid response object from the server
                    return
                }
                // If the code is 200, the server responded successfully
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil) // Didn't bring any data
                        return
                    }
                    // Creating our json object with the obtained data
                    do {
                        let apiResult = try JSONDecoder().decode(APIResult.self, from: data)
                        onComplete(apiResult)  // We return the array
                    } catch {
                        onComplete(nil)
                    }
                } else {
                    onComplete(nil)
                }
            }
        }
        
        // This call is essential because without it the task is not executed
        task.resume()
    }
}
