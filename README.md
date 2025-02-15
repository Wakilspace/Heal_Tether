# Flutter MVVM API App

## Overview
This is a simple **Flutter** application built using the **MVVM architecture**. The app fetches user data from an external API and displays it in a list. It utilizes **Riverpod** for state management, handles loading and error states, and includes a search functionality for filtering users by name.

## Features
- **Fetch data from API**: Retrieves user information from `https://jsonplaceholder.typicode.com/users`.
- **MVVM Architecture**: Maintains a clean separation of concerns.
- **State Management**: Uses **Riverpod** for efficient state handling.
- **Search Functionality**: Filters users dynamically as you type.
- **Pull-to-Refresh**: Refresh the list of users by swiping down.
- **Error Handling**: Displays appropriate messages in case of API failure.
- **User-Friendly UI**: Data is displayed using `Card` widgets for better readability.

## Project Structure
```
lib/
│-- main.dart
│-- model/
│   │-- user_model.dart
│-- service/
│   │-- api_service.dart
│-- viewmodel/
│   │-- user_viewmodel.dart
│-- view/
│   │-- home_screen.dart
```

## Installation
1. Clone the repository:
   ```sh
   git clone <your-repo-url>
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter_mvvm_api
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Dependencies
Ensure these dependencies are added to `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.3.6
  http: ^0.13.6
```

## API Integration
The app fetches user data from `https://jsonplaceholder.typicode.com/users` using the `http` package and maps the JSON response to a `UserModel`.

## Screenshots
(Include relevant screenshots here)

## Contribution
Feel free to fork this repository and submit a pull request if you have improvements.

## License
This project is licensed under the MIT License.

