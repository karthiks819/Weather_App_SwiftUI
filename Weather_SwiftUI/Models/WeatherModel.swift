//
//  WeatherModel.swift
//  Weather_SwiftUI
//
//  Created by Karthik Solleti on 18/12/25.
//


import Foundation

// MARK: - WeatherModel
class WeatherModel: Codable {
    let location: Location?
    let current: Current?
    
    init(location: Location?, current: Current?) {
        self.location = location
        self.current = current
    }
}

// MARK: - Current
class Current: Codable {
    
    let tempC, tempF: Double?
    
    let condition: Condition?
    
    
    let feelslikeF, feelslikeC: Double?
    
    
    enum CodingKeys: String, CodingKey {
        
        case tempC = "temp_c"
        case tempF = "temp_f"
        
        case condition
        
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        
    }
    
    init( tempC: Double?, tempF: Double?, condition: Condition?,feelslikeC: Double?, feelslikeF: Double?) {
        
        self.tempC = tempC
        self.tempF = tempF
        
        self.condition = condition
        
        self.feelslikeC = feelslikeC
        self.feelslikeF = feelslikeF
        
    }
}

// MARK: - Condition
class Condition: Codable {
    let text, icon: String?
    let code: Int?
    
    init(text: String?, icon: String?, code: Int?) {
        self.text = text
        self.icon = icon
        self.code = code
    }
}

// MARK: - Location
class Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
    
    init(name: String?, region: String?, country: String?, lat: Double?, lon: Double?, tzID: String?, localtimeEpoch: Int?, localtime: String?) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.tzID = tzID
        self.localtimeEpoch = localtimeEpoch
        self.localtime = localtime
    }
}
