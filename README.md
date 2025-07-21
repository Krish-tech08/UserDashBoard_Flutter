# UserDashBoard_Flutter 🚀

A modern Flutter-based user dashboard app that displays user information fetched from APIs. The app features clean UI, asynchronous HTTP data loading, and modular components for easy scaling.

## 📱 Features

- 📡 Fetches and displays user data from a REST API
- 🧱 Modular UI using custom widgets (`UserCard`)
- ⚡ Responsive layout with stateful widgets
- 🔁 Pull-to-refresh support (optional)
- 🌐 HTTP integration using `http` package

## 🖼️ Screenshots

| Dashboard View | Report Screen | Create User Screen |
|----------------|------------|-----------|
| ![Dashboard](Screen_shot/Screenshot%202025-07-21%20230622.png) | ![Cards](Screen_shot/Screenshot%202025-07-21%20230640.png) | ![Load](Screen_shot/Screenshot%202025-07-21%20230703.png) |

> 📁 Screenshots are stored in `Screen_shot/` folder.

## 🛠 Tech Stack

- Flutter
- Dart
- REST API (JSONPlaceholder or similar)
- http package

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Krish-tech08/UserDashBoard_Flutter.git
cd UserDashBoard_Flutter
2. Install Dependencies
bash
Copy
Edit
flutter pub get
3. Run the App
bash
Copy
Edit
flutter run
📁 Project Structure
css
Copy
Edit
lib/
├── main.dart
├── models/
│   └── user_model.dart
├── widgets/
│   └── user_card.dart
└── screens/
    └── dashboard_screen.dart
Screen_shot/
└── [Screenshot Images]
✅ TODO
 Add user filtering or search

 Implement pagination

 Add theme switching (dark/light)

 Add error/loading state UI

📄 License
This project is licensed under the MIT License. See the LICENSE file for details.

Created with ❤️ by Krish Kumar Chaurasia
