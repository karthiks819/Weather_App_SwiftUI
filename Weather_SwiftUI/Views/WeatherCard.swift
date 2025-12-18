//
//  WeatherCard.swift
//  Weather_SwiftUI
//
//  Created by Karthik Solleti on 18/12/25.
//

import SwiftUI

struct WeatherCard: View {
    let weatherModel: WeatherModel
    
    
    var useFahrenheit: Bool = false
    
    var displayUnit: String {
        useFahrenheit ? String(format: "%.1fF", weatherModel.current?.tempF ?? 0) :  String(format: "%.1f˚C", weatherModel.current?.tempC ?? 0)
    }
    
    
    var displayFeelsLike: String {
        useFahrenheit ? String(format: "Feels like %.1fF", weatherModel.current?.feelslikeF ?? 0) :  String(format: "%.1f˚C", weatherModel.current?.feelslikeC ?? 0)
    }
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: weatherModel.current?.condition?.icon ?? "")!) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                
            }
            Text("Location: \(weatherModel.location?.name ?? "") \n Country:\(weatherModel.location?.country ?? "")" )
                .font(.title)
                .fontWeight(.bold)
            Text("\(displayUnit)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            
            Text("\((weatherModel.current?.condition?.text ?? ""))")
                .font(.headline)
                .foregroundStyle(Color.white)
            
            Text("\(displayFeelsLike)")
                .font(.headline)
                .foregroundStyle(Color.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors: [.red, .yellow, .green,.indigo,.purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
//    WeatherCard(weatherModel: WeatherModel(location: Location(name: "TEST", country: "RTEST"), current: nil))
}
