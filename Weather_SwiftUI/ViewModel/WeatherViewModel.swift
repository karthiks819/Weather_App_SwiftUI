//
//  WeatherViewModel.swift
//  Weather_SwiftUI
//
//  Created by Karthik Solleti on 18/12/25.
//

import Foundation
import Observation

@Observable
class WeatherViewModel {
    var city: String = ""
    var weatherModel: WeatherModel?
    var isLoading: Bool = false
    var errorMessage: String?
    
    
    private let APIKey = "4ed5b8a98093479c85844207251812"
    
    @MainActor
    func fetchWeather() async {
        // Force update the loading state to notify SwiftUI
        await MainActor.run {
            self.isLoading = true
        }

        do {
            let fetchedWeather = try await getWeather()
            await MainActor.run {
                self.weatherModel = fetchedWeather
                self.errorMessage = nil
            }
        } catch {
            if let weatherError = error as? WeatherError {
                await MainActor.run {
                    self.errorMessage = weatherError.localizedDescription
                    self.weatherModel = nil
                }
            } else {
                await MainActor.run {
                    self.errorMessage = "Unexpected Error \(error.localizedDescription)"
                    self.weatherModel = nil
                }
            }
        }

        // Update isLoading after the async work is done to hide the progress indicator
        await MainActor.run {
            self.isLoading = false
        }
    }
    
    func getWeather() async throws -> WeatherModel?  {
       
        let url = "https://api.weatherapi.com/v1/current.json?key=\(APIKey)&q=\(self.city)&aqi=no"
        guard let url = URL(string: url) else {
            throw WeatherError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.unknownError
        }
        
        guard httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(WeatherModel.self, from: data)
        }catch {
            print(error.localizedDescription)
            throw WeatherError.decodingFailed
        }
       
    }
    
}


