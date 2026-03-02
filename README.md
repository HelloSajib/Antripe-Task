# 📱 Antripe Flutter Assignment

A Flutter application built from a provided Figma design and GET API for the Antripe technical assignment.
This project focuses on pixel-perfect UI, clean architecture (DDD-based), API integration, search & filtering, and smooth user experience.

---

## 🧩 Assignment Overview

This project was developed based on the official assignment requirements provided by **Antripe**.

**Core Evaluation Goals:**

* Pixel-perfect UI implementation from Figma
* Clean Flutter architecture & production-ready code
* API integration + state management
* Category filtering + search (name & phone)
* Smooth animations & UI polish

---

## 🔗 Resources Used

* 🎨 **Figma Design:**
  [https://www.figma.com/design/rtRcWLCvXI1BapaupLmOHK/Task?node-id=0-1&p=f&t=uRJlJYJe8uT59cj1-0](https://www.figma.com/design/rtRcWLCvXI1BapaupLmOHK/Task?node-id=0-1&p=f&t=uRJlJYJe8uT59cj1-0)

* 🌐 **API (GET):**
  [https://api.antripe.com/v1/contact/api.json](https://api.antripe.com/v1/contact/api.json)

---

## ✨ Features Implemented

### 🚀 Splash Screen

* Custom splash screen with smooth tween animation
* Follows brand style from Figma
* Clean animation with focus on polish and performance

### 🏠 Home Screen

* API call on load
* Contacts list rendered from network data
* Loading state with skeleton UI
* Empty state (no data)
* Error state handling (network / API failure)

### 🗂 Categories (Horizontal Scroll)

* Categories displayed in horizontal list
* Active state UI for selected category
* Filters contacts by selected category
* Fully matches spacing, padding, and typography from Figma

### 🔍 Search

* Search by:

  * Name
  * Phone number
* Debounced search input
* Works together with category filter
* Smooth UX without UI jank

---

## 🧱 Architecture

This project follows **DDD-based Clean Architecture** with feature-based folder structure.

```
lib/
 ├─ config/
 ├─ core/
 ├─ features/
 │   └─ home/
 │       ├─ data/
 │       │   ├─ datasource/
 │       │   │     ├─ remote_datasource/
 │       │   ├─ entities/
 │       │   ├─ repositories/
 │       │   └─ usecases/
 │       │   ├─ models/
 │       │   └─ repositories/
 │       ├─ domain/
 │       │   ├─ entities/
 │       │   ├─ repositories/
 │       │   └─ usecases/
 │       ├─ presentation/
 │       │   ├─ bloc/
 │       │   ├─ presentation/
 │       │   └─ widgets/
 └─ widgets/
```

**Layers:**

* `data` → API models, repositories
* `domain` → entities, use cases
* `presentation` → UI + BLoC

---

## 🧠 State Management

* BLoC (`flutter_bloc`)
* Clean separation of concerns
* UI reacts to state changes
* Search debouncing implemented at BLoC level

---

## 📦 Libraries Used & Why

| Package              | Purpose                   |
| -------------------- | ------------------------- |
| flutter_bloc         | State management          |
| dio                  | API networking            |
| get_it               | Dependency injection      |
| dartz                | Functional error handling |
| equatable            | Value equality for states |
| skeletonizer         | Loading skeleton UI       |
| flutter_screenutil   | Responsive UI             |
| cached_network_image | Image caching             |
| go_router            | Navigation                |
| google_fonts         | Typography                |
| flutter_svg          | SVG asset support         |
| hive / hive_flutter  | Local storage (if needed) |
| logger               | Debug logging             |
| toastification       | User feedback messages    |

---

## 🧪 Development Environment

This SDK was built and tested with the following environment:

```
[√] Flutter (Channel stable, 3.38.5, on Microsoft Windows [Version 10.0.22000.2538], locale en-US) [708ms]
    • Flutter version 3.38.5 on channel stable at C:\src\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision fcf2c11572 (4 months ago), 2025-06-24 11:44:07 -0700
    • Engine revision dd93de6fb1
    • Dart version ^3.10.4
    • DevTools version 2.45.1
```

> ✅ **Note**: It is recommended to use the same or newer version of Flutter and Dart to avoid compatibility issues.

---

## 🛠 Setup Instructions

### 1️⃣ Clone Repository

```bash
git clone <your-repository-url>
cd flutter_task
```

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Generate Splash & App Icons (if needed)

```bash
flutter pub run flutter_native_splash:create
flutter pub run flutter_launcher_icons
```

### 4️⃣ Run the App

```bash
flutter run
```

---

## 📲 How to Use

1. App launches with animated splash screen
2. Home screen loads contacts from API
3. Select category to filter contacts
4. Use search field to search by name or phone
5. Search works with category filter together
