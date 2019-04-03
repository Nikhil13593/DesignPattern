//
//  AppleApplicationsModel.swift
//  DesignPattern
//
//  Created by Nikhil Patil on 03/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import Foundation

struct AppleApps: Codable {
    
    var feed : Feed
    
}

struct Feed: Codable {
    
    var title: String
    var country: String
    var results: [Result]
    
}


struct Result: Codable {
    
    var name:String
    var releaseDate:String
    var artworkUrl100: String
    
}
