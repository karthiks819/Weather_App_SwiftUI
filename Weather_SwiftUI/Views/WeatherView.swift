//
//  WeatherView.swift
//  Weather_SwiftUI
//
//  Created by Karthik Solleti on 18/12/25.
//

import SwiftUI

struct WeatherView: View {
    @State var vm: WeatherViewModel =  WeatherViewModel()
    @AppStorage("useFahrenheit")
    private var useFahrenheit: Bool = false
    
    var body: some View {
        NavigationStack{
           VStack {
               TextField("Enter your city", text: $vm.city)
                   .textFieldStyle(.roundedBorder)
                   .padding()
               
               Button {
                   Task {
                       await vm.fetchWeather()
                   }
               } label: {
                   Label("Fetch Weather", systemImage: "cloud.sun.fill")
               }
               .buttonStyle(.borderedProminent)
               .disabled(vm.city.count < 3)
               
               
               if vm.isLoading {
                   ProgressView("Loading")
                       .padding()
               } else if  vm.errorMessage != nil {
                   ErrorMessagesView()
               } else if let weatherModel = vm.weatherModel {
                   WeatherCard(
                    weatherModel: weatherModel,
                    useFahrenheit: useFahrenheit
                   )
               }
               
               Spacer()
            }
           .navigationTitle("Weather App")
           .background(Color.blue.opacity(0.25))
           .toolbar {
               ToolbarItem {
                   Menu {
                       Toggle(isOn: $useFahrenheit) {
                           Label {
                             Text(useFahrenheit ? "Use Celsius" : "Use Fahrenheit")
                           } icon: {
                               Image(systemName: "thermometer.sun")
                           }
                       }
                       .toggleStyle(.automatic)
                   } label: {
                       Image(systemName: "gear")
                   }

               }
           }
        }
        
    }
}

#Preview {
    WeatherView()
}
