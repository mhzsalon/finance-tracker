# Finance Tracker

A Flutter app to track income and expenses with a clean dashboard, categories, and local storage.

## Features

- **Onboarding** — First-time intro flow
- **Dashboard** — Overview with total income, total expenses, spending chart, and recent transactions
- **Transactions** — Add and list income/expense entries with amount, title, date, and category
- **Categories** — Category support for organizing expenses
- **Local storage** — Data persisted locally with [Hive](https://docs.hivedb.dev/) (no account required)

## Demo

[![Watch the demo](https://img.youtube.com/vi/yUfO51mZh_8/0.jpg)](https://youtube.com/shorts/yUfO51mZh_8)

## Tech stack

| Area | Choice |
|------|--------|
| **Framework** | Flutter |
| **State management** | [Riverpod](https://riverpod.dev/) |
| **Local DB** | [Hive](https://docs.hivedb.dev/) |
| **Navigation** | Flutter Navigator (Material) |
| **Code gen** | [Freezed](https://pub.dev/packages/freezed), [json_serializable](https://pub.dev/packages/json_serializable) |
| **Functional style** | [dartz](https://pub.dev/packages/dartz) (e.g. `Either` for errors) |
| **UI** | [flutter_screenutil](https://pub.dev/packages/flutter_screenutil), custom theme (Inter & Poppins) |

## Project structure

```
lib/
├── core/               # Theme, storage, extensions, errors, utils
├── features/
│   ├── onboarding/     # Onboarding flow & app preferences
│   ├── dashboard/      # Dashboard summary & chart
│   ├── transactions/   # Add/list income & expenses
│   └── categories/     # Category data & UI
├── shared/             # Home tabs, shared widgets, enums
├── main.dart
└── splash_screen.dart
```

## Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (SDK ^3.9.2)
- Dart 3.9.2+

## Getting started

1. **Clone the repo**

   ```bash
   git clone https://github.com/YOUR_USERNAME/universalexpensetracker.git
   cd universalexpensetracker
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code** (Freezed & json_serializable)

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**

   ```bash
   flutter run
   ```

## Build

- **Debug:** `flutter run`
- **Release APK:** `flutter build apk`
- **Release App Bundle:** `flutter build appbundle`
- **iOS:** `flutter build ios` (on macOS with Xcode)

## Assets

Place images under `assets/images/` and `assets/images/onboarding/`. Fonts (Inter, Poppins) are in `assets/fonts/`.

## License

This project is not published to pub.dev (`publish_to: 'none'`). Use it under your own terms or add a license file (e.g. MIT) as needed.
