# NetRe

**NetRe** is a Flutter-based movie app that allows users to search and view movie details using data from TVMaze API. It includes features like movie search, details view, and responsive design that adapts to various screen sizes like mobile, tablet, and desktop.

## Photos

### Photo 1
![Photo 1](path/to/photo1.jpg)

### Photo 2
![Photo 2](path/to/photo2.jpg)

### Photo 3
![Photo 3](path/to/photo3.jpg)

## Features

- Movie search functionality with API integration.
- Display movie details, including summary, genres, release year, and rating.
- Responsive design for different screen sizes (mobile, tablet, laptop).
- Smooth navigation between screens using Flutter's navigation system.

## Getting Started

This project is a starting point for a Flutter application. To get started, you need to have Flutter installed on your machine.

### Prerequisites

1. Install [Flutter](https://flutter.dev/docs/get-started/install).
2. Ensure you have [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) installed for code editing.
3. Set up an emulator or use a physical device to test the app.

### Setup

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/netre.git
    cd netre
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

    You should now be able to see the **NetRe** movie app running on your emulator or physical device.

## Project Structure

- **lib/**: Contains all the Flutter app code.
  - **screens/**: Contains the UI screens like HomeScreen, DetailsScreen, and SearchScreen.
  - **widgets/**: Contains reusable widgets like MovieCard.
  - **models/**: Contains data models for movie-related data (optional).
  
- **assets/**: Contains static resources such as images (if applicable).

## Dependencies

The app uses the following Flutter packages:

- `http`: For making HTTP requests to the TVMaze API.
- `flutter/material.dart`: For building the UI.
- Other standard Flutter libraries for UI and navigation.

## API Integration

The app fetches movie data using the [TVMaze API](https://www.tvmaze.com/api). The `searchMovies` function sends a query to the API and returns a list of movies based on the user's search.

### API Request Example:

```dart
final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
```
## How to Contribute

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

## License

This project is open-source and available under the [MIT License](LICENSE).
