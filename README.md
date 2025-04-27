# 🎵 Spotify Clone (Flutter)

A clean and fully functional **Spotify Clone** built using **Flutter**.  
This app includes **Google Authentication**, a **custom Audio Player**, modern **Light/Dark Theme Switching**, and a beautiful **Home Screen UI** — all closely inspired by Spotify!

---

## ✨ Features

- ✅ **Google Authentication** (Sign in with Google)
- ✅ **Responsive UI** (Mobile-friendly using `flutter_screenutil`)
- ✅ **Light & Dark Theme** (Auto theme switching supported)
- ✅ **Audio Player** (Play songs using `just_audio`)
- ✅ **Seek & Control** Audio Playback (Play, Pause, Seek)
- ✅ **State Management** with `flutter_bloc` and `hydrated_bloc`
- ✅ **Home Screen UI** (Display songs, albums, etc.)
- ✅ **Dependency Injection** with `get_it`
- ✅ **Firestore** for storing user data (if extended)
- ✅ **Routing** handled with `auto_route`
- ✅ **Fully responsive and scalable architecture**

---

## 🚀 Packages Used

| Package                  | Purpose                                 |
|---------------------------|-----------------------------------------|
| `cupertino_icons`         | iOS style icons                        |
| `flutter_svg`             | Rendering SVG images                   |
| `auto_route`              | Routing management                     |
| `flutter_screenutil`      | Responsive design                      |
| `flutter_bloc`            | BLoC state management                  |
| `hydrated_bloc`           | Persistent state management            |
| `path_provider`           | Access device storage                  |
| `firebase_core`           | Firebase core integration              |
| `firebase_auth`           | Firebase Authentication                |
| `cloud_firestore`         | Firestore database                     |
| `get_it`                  | Dependency Injection                   |
| `fpdart`                  | Functional programming in Dart         |
| `just_audio`              | Audio playback                         |
| `flutter_spinkit`         | Loading spinners and animations        |
| `google_sign_in`          | Google Sign In                         |

---

## 🛠️ Project Structure

lib/
 ├── core/            # Common utilities, themes, constants
 ├── features/        # Features (Auth, Audio Player, Home)
 │    ├── auth/
 │    ├── audio_player/
 │    ├── home/
 ├── injection/       # Dependency Injection setup (get_it)
 ├── routes/          # App Routing (auto_route)
 └── main.dart        # Entry point


---

## 📱 Screenshots

> *(Add your app screenshots here once ready!)*

| Login Screen | Home Screen | Audio Player | Dark Mode |
|:------------:|:-----------:|:------------:|:---------:|
| ![Login]     | ![Home]      | ![Player]     | ![Dark]  |

---

## 🛠 Setup Instructions

1. **Clone the repo**
   ```bash
   https://github.com/RohanBudhathoki/spotifyclone.git
   cd spotify-clone-flutter
