# Mood Tracker UI

Mood Tracker UI is a Flutter application that helps you log your emotional state throughout the day and visualise patterns over time.

## Features

- Quick mood logging with emoji-based selector  
- Optional notes for each entry  
- Daily, weekly and monthly statistics with charts  
- Local persistence (SQLite) – works completely offline  
- Dark & light themes following system preference  

## Getting Started

1. Install the latest stable [Flutter SDK](https://docs.flutter.dev/get-started/install).  
2. Fetch dependencies:

```bash
flutter pub get
```

3. Run on an attached device or emulator:

```bash
flutter run
```

## Folder Structure

```text
lib/
 ├── main.dart          # App entry point
 ├── ui/                # Presentation layer
 ├── models/            # Data models
 ├── services/          # Persistence & business logic
assets/
```

## Screenshots

| Log Mood | Statistics |
|----------|------------|
| ![Log screen](screenshots/log.png) | ![Stats screen](screenshots/stats.png) |

*(Add screenshots to the `screenshots/` folder to make them appear here.)*

## Contributing

Pull requests are welcome! For major changes please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
