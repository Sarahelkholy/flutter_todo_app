# 📝 Flutter To‑Do App (Riverpod + SQLite)

This is a simple To‑Do list mobile app built using **Flutter**, **Riverpod** for state management, and **SQLite** for local data persistence. The app allows users to manage tasks effectively with a smooth and clean UI.

![Flutter](https://img.shields.io/badge/Built%20With-Flutter-blue?logo=flutter)

---

## 🚀 Features

- ✅ Add new tasks
- ✏️ Edit existing tasks
- 🗑️ Delete tasks
- ✅ Mark tasks as completed
- 💾 Local data storage using SQLite
- ⚙️ State management using Riverpod

---

## 🧰 Tech Stack

- Flutter
- Riverpod
- Sqflite
- Path Provider

---

## 📂 Folder Structure

```
lib/
├── App/
│   └── todo_app.dart
│
├── config/
│   ├── routes.dart
│   └── theme.dart
│
├── data/
│   ├── datasource/
│   ├── model/
│   └── repositories/
│
├── provider/
│   └── task/
│       ├── categoryProvider.dart
│       ├── dateProvider.dart
│       └── timeProvider.dart
│
├── Screens/
│   ├── HomeScreen.dart
│   └── CreatTask.dart
│
├── utils/
│   ├── appAlert.dart
│   ├── DBKeys.dart
│   ├── extentions.dart
│   ├── helpers.dart
│   ├── Task_category.dart
│   └── taskKeys.dart
│
├── widgets/
│   └── (all reusable UI components)
│
└── main.dart
```

---

## 🔧 Getting Started

### Prerequisites

- Flutter SDK (3.x or later)
- Dart
- VS Code / Android Studio
- Emulator or physical device

### Installation

```bash
git clone https://github.com/Sarahelkholy/flutter_todo_app.git
cd flutter_todo_app
flutter pub get
flutter run
```

### Screen record


https://github.com/user-attachments/assets/58be1fa4-4eb7-4e04-8e7b-b09fba5da1f8


