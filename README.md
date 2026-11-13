# Posts Management App

A Flutter application for managing posts through REST API integration, developed as part of my Flutter training with **dot.jordan**, funded by **UNICEF**.

## About the Project

This project demonstrates how to integrate a Flutter application with a REST API and perform CRUD operations to manage posts.

The application uses [JSONPlaceholder](https://jsonplaceholder.typicode.com/) as a testing API.

## Features

- Fetch and display posts from REST API.
- Create new posts.
- Update existing posts.
- Delete posts.
- View post details.
- Form validation.
- Loading indicators and error handling.

## Technologies Used

- Flutter
- Dart
- REST API
- Provider & ChangeNotifier
- JSONPlaceholder
- MVC Architecture

## Project Structure

```text
lib/
├── controllar/
│   └── api_provider.dart
├── models/
│   └── api_model.dart
├── view/
│   ├── create_post_page.dart
│   ├── edit_post_page.dart
│   ├── home_page.dart
│   └── post_details.dart
└── main.dart
```

## API Operations

| Method | Operation |
|---|---|
| GET | Fetch posts |
| POST | Create a post |
| PUT | Update a post |
| DELETE | Delete a post |

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/MtasemQwaqneh/posts_app.git
```

2. Navigate to the project directory:

```bash
cd posts_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Important Note

JSONPlaceholder is a testing API. POST, PUT, and DELETE requests return simulated responses and do not permanently modify the server's data.

---

**Developed by:** Mutasem Al-Qawaqneh

**GitHub:** https://github.com/MtasemQwaqneh
