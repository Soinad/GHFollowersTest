//
//  GFError.swift
//  GHFollowers
//
//  Created by Daniel Salmon on 04/01/2020.
//  Copyright © 2020 Soinad. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request, please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection!"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recieved form the server was invalid. Please try again"
    
    
}
