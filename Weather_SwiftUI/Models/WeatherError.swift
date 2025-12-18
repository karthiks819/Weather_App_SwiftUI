//
//  WeatherError.swift
//  Weather_SwiftUI
//
//  Created by Karthik Solleti on 18/12/25.
//
import Foundation

enum WeatherError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case unknownError
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed(statusCode: let statusCode):
            return "Request failed with status code: \(statusCode)"
        case .decodingFailed:
            return "Failed to decode the response"
        case .unknownError:
            return "An unknown error occurred"
        }
    }
}
