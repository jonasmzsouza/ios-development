//
//  MyClass.swift
//  MyApp
//
//  Created by Jonas Muniz on 05/03/21.
//

import Foundation
class MyClass {
    
    private var name: String
    
    func getWelcomeMessage() -> String {
        return "This was first class created by \(name) in an iOS project."
    }
    
    init(name: String) {
        self.name = name
    }
}
