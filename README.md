# Weather SwiftUI App

A beautiful and functional weather application built with SwiftUI and the WeatherAPI service. This app demonstrates modern SwiftUI patterns with async/await, the new `@Observable` macro from Swift 5.9+, and proper state management.

## Features

- Real-time weather information fetching from WeatherAPI
- Temperature display in both Celsius and Fahrenheit
- Location-based weather data
- Clean and intuitive user interface
- Loading states and error handling
- Dark mode support
- Responsive design for all iOS devices

## Prerequisites

- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.9 or later
- WeatherAPI account (free tier available)

## Setup

1. Clone or download the project
2. Open `Weather_SwiftUI.xcodeproj` in Xcode
3. Get your free API key from [WeatherAPI](https://www.weatherapi.com/)
4. Replace the placeholder API key in `WeatherViewModel.swift`:

```swift
private let APIKey = "YOUR_API_KEY_HERE"
```

## Architecture

### MVVM Pattern

The app follows the Model-View-ViewModel (MVVM) architectural pattern:

#### Models
- `WeatherModel.swift`: Defines the data structure for weather information
- `WeatherError.swift`: Custom error types for weather-related operations

#### Views
- `WeatherView.swift`: Main entry point with city input and weather display
- `WeatherCard.swift`: Displays the detailed weather information
- `ErrorMessagesView.swift`: Shows friendly error messages when API requests fail

#### ViewModel
- `WeatherViewModel.swift`: Manages app state, API calls, and data processing using the new `@Observable` macro

### Key Technologies & Concepts

- **SwiftUI**: Declarative UI framework for building the interface
- **Async/Await**: Modern Swift concurrency for API calls
- **@Observable Macro**: New Swift 5.9+ macro for reactive state management (replaces `@ObservedObject`/`@StateObject`)
- **WeatherAPI**: External weather data service integration
- **@AppStorage**: Persists user preference for temperature units

## How to Use

1. Enter a city name in the text field (minimum 3 characters required)
2. Tap the "Fetch Weather" button
3. View the weather information in the card below
4. Toggle between Celsius and Fahrenheit using the gear menu in the toolbar

## Error Handling

The app gracefully handles various error scenarios:
- Invalid URLs
- Network request failures
- JSON decoding errors
- API rate limits or service unavailability

Custom error messages are displayed when issues occur.

## Temperature Units

Users can switch between Celsius and Fahrenheit through the settings menu accessed via the gear icon in the navigation bar. The selected preference is persisted using `@AppStorage`.

## API Integration

The app uses WeatherAPI to fetch current weather conditions. The implementation includes:
- Proper URL construction with query parameters
- HTTP status code validation
- JSON response parsing
- Error handling for various failure scenarios

## SwiftUI Best Practices Implemented

- Proper state management with `@State`, `@AppStorage`, and `@Observable`
- Conditional view rendering for different app states
- Async task handling in views
- Responsive layout with VStack and automatic scaling
- Environment-aware colors and styling

## Project Structure

```
Weather_SwiftUI/
├── Models/
│   ├── WeatherError.swift
│   └── WeatherModel.swift
├── ViewModel/
│   └── WeatherViewModel.swift
├── Views/
│   ├── ErrorMessagesView.swift
│   ├── WeatherCard.swift
│   └── WeatherView.swift
└── Assets.xcassets/
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is available for personal and educational use. See the LICENSE file for details.

## Support

If you encounter issues with the application:

1. Check that your API key is valid and properly formatted
2. Verify your internet connection
3. Confirm the city name is spelled correctly and is recognized by WeatherAPI
4. Review the console for any runtime errors

For additional support, feel free to open an issue in the repository.

---

Built with ❤️ using SwiftUI and Swift 5.9+
