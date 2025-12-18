//
//  ErrorMessagesView.swift
//  Weather_SwiftUI
//
//  Created by Karthik Solleti on 18/12/25.
//

import SwiftUI

struct ErrorMessagesView: View {
    private let friedlyErrorMessage: [String] = [
        "Something went wrong",
        "we couldn't fetch at this time",
        "Please try again later",
        "We're sorry, something went wrong",
        "Please try again later"
    ]
    
    var message: String {
        friedlyErrorMessage.randomElement() ?? "Something went wrong"
    }
    
    var body: some View {
        VStack(spacing: 10) {
           Image(systemName: "cloud.drizzle.fill")
            Text("Weather Unavailable")
            Text(message)
                .multilineTextAlignment(.center)
        }
            .foregroundStyle(Color.white)
            .fontWeight(.medium)
            .font(.title)
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [.red, .yellow, .green,.indigo,.purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 10)
            .padding()
    }
}

#Preview {
    ErrorMessagesView()
}
