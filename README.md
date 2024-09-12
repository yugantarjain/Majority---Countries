# Majority - Countries

Sample project to fetch country data from `https://restcountries.com` and display it in a beautiful user interface with the latest technologies and clean code.

Built on Xcode 15

| List View  | Detail View |
| ------------- | ------------- |
| <img width="485" alt="Screenshot 2024-09-12 at 4 30 43 PM" src="https://github.com/user-attachments/assets/af779ede-caa4-4ab2-9f98-7c418f3badb8">  |  <img width="485" alt="Screenshot 2024-09-12 at 4 37 48 PM" src="https://github.com/user-attachments/assets/35f8c74a-5328-4961-8976-75cb67224240"> |
|  <img width="485" alt="Screenshot 2024-09-12 at 4 31 31 PM" src="https://github.com/user-attachments/assets/db79081d-9b48-48d3-a1db-0726940ec3f0">  |  <img width="485" alt="image" src="https://github.com/user-attachments/assets/254c0884-3af7-4071-ba85-20bfc9440569"> |

Tech stack:  
SwiftUI, Combine, SwiftData, Swift Catalog, XCTest.

Architecture (MVVM):  
REST API -> App response Codable -> Persistent SwiftData model -> View/ViewModel

## Features and technology:

### User interface (SwiftUI):
- Uses SwiftUI for the most modern UI code.
- Uses the newest navigation frameworks including NavigationStack and .navigationDestination modifier..
- Uses Swift macros for the latest data modelling capabilites and fast on-device filtering/searching.
- Leverages SwiftUI's native animation support for a fun feature.

### Networking (Combine):
- Uses the Combine framework for networking with the REST APIs.
- Allows for a simple and powerful generic networking layer.
- Built to by testable through injection of custom URLSession when required.
- Due to Combine's `AnyCancellable`, it automatically cancels redundant requests. For example, if the "login" button would be pressed multiple times.
- Async/await can also be a good option.

### Caching (SwiftData):
- Uses SwiftData to cache the network response and also drive the UI.
- This is architecturally beautiful while at the same time being effortlessly powerful.
- The network response acts as the source of truth for the app. This is mapped to a SwiftData model which drives the UI while also persisting the data.

### Localization (String Catalog):
- Uses the latest technology for localisation: Swift Catalogs

### Testing (XCTest):
- Testing of algorithmic logic and asynchronous code done through fast and reliable unit tests.
- MockURLProtocol created for easy testing of networking code.
