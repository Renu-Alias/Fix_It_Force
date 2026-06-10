# Fix It Force

**Fix It Force** is a hybrid platform that combines a marketplace with on-demand services to streamline repair and maintenance workflows, optimize provider utilization, and connect homeowners, skilled workers, and hardware dealers in one integrated ecosystem.

---

## About

Fix It Force addresses inefficiencies in traditional repair and maintenance markets by offering:

| Pillar | Description |
|--------|-------------|
| **Hybrid Platform** | Marketplace + on-demand services in a single experience |
| **Online Shopping** | Appliances, tools, and authentic spare parts with expert guidance |
| **Worker Services** | Booking for electricians, plumbers, painters, and other skilled professionals |
| **Sellers Portal** | Digital storefronts for dealers and manufacturers to list electrical and plumbing components |

The platform serves homeowners, contractors, retailers, and industry professionals—enhancing convenience, trust, and transparency across the supply chain.

---

## Problem Statement

Traditional repair and maintenance markets face three core challenges:

1. **Fragmented access to reliable home services** — Homeowners struggle to find trustworthy providers, leading to inconsistent quality, delayed responses, and inefficient booking.
2. **Time lost sourcing parts offline** — Fragmented suppliers and no real-time availability cause project delays and higher operational costs.
3. **Lack of online visibility for small hardware dealers** — Limited digital presence restricts reach and sales growth amid rising online competition.

---

## Solution

Fix It Force delivers an integrated platform with three connected capabilities:

### Instant purchase of tools and appliances
Users can buy necessary tools and appliances within the platform, streamlining repairs and improving customer satisfaction.

### On-site parts ordering by workers
Field workers can order parts on-site during a job, reducing downtime and integrating inventory access directly into the repair workflow.

### Digital storefronts for dealers
Dealers get inventory management, real-time analytics, and customer engagement tools to expand market reach through a unified platform.

---

## Key Features

### Customer App (current implementation)

- **Service booking** — Browse and book skilled professionals (plumbing, electrical, HVAC, painting, carpentry, roofing, and more).
- **Online shop** — Browse and purchase tools, power drills, hand tools, and related hardware.
- **Order tracking** — View service and product orders in one place.
- **User profile** — Account and preferences management.

### Planned Platform Capabilities

- **Sellers / Dealer Portal** — Listings, inventory, and analytics for hardware dealers and manufacturers.
- **Worker mobile experience** — On-site parts ordering and job management.
- **Backend & APIs** — Authentication, payments, real-time inventory, and provider matching.
- **Admin dashboard** — Platform oversight, analytics, and moderation.

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| **Mobile & Web Client** | [Flutter](https://flutter.dev/) (Dart SDK ^3.10) |
| **UI Framework** | Material Design 3 |
| **State & Navigation** | Flutter built-in (`StatefulWidget`, `Navigator`) |
| **Linting** | `flutter_lints` |
| **Target Platforms** | Android, iOS, Web, Windows, macOS, Linux |

> **Note:** The current repository contains the Flutter client application with UI screens and mock data. Backend services, database, and dealer portal are planned for future phases.

---

## Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.10 or later)
- [Dart SDK](https://dart.dev/get-dart) (bundled with Flutter)
- A code editor ([VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))
- Platform-specific tooling as needed:
  - **Android:** Android Studio, Android SDK
  - **iOS (macOS only):** Xcode
  - **Web:** Chrome (for debugging)
  - **Windows:** Visual Studio with Desktop development with C++

Verify your setup:

```bash
flutter doctor
```

All checks should pass for your target platform(s).

---

## Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-org/fix-it-force.git
   cd fix-it-force
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **(Optional) Run static analysis**

   ```bash
   flutter analyze
   ```

---

## Running the App

### Mobile (Android / iOS)

Connect a device or start an emulator, then run:

```bash
flutter run
```

### Web

```bash
flutter run -d chrome
```

### Desktop

```bash
# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

### Build for release

```bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS (macOS only)
flutter build ios

# Web
flutter build web
```

### Run tests

```bash
flutter test
```

---

## Project Structure

```
fix-it-force/
├── android/                 # Android native project
├── ios/                     # iOS native project
├── web/                     # Web entry point and manifest
├── windows/                 # Windows desktop project
├── macos/                   # macOS desktop project
├── linux/                   # Linux desktop project
├── lib/                     # Application source code
│   ├── main.dart            # App entry point
│   ├── theme/
│   │   └── app_theme.dart   # Colors, typography, and Material theme
│   └── screens/
│       ├── splash_screen.dart
│       ├── login_screen.dart
│       ├── main_shell.dart          # Bottom navigation shell
│       ├── services/
│       │   ├── services_screen.dart       # Browse services
│       │   └── service_booking_screen.dart # Book a service
│       ├── shop/
│       │   ├── shop_screen.dart           # Product catalog
│       │   └── product_detail_screen.dart # Product details
│       ├── orders/
│       │   └── orders_screen.dart         # Order history & tracking
│       └── profile/
│           └── profile_screen.dart        # User profile
├── test/
│   └── widget_test.dart     # Widget tests
├── pubspec.yaml             # Dependencies and project metadata
└── analysis_options.yaml    # Dart analyzer and lint rules
```

---

## Screens Overview

| Screen | Route / Entry | Purpose |
|--------|---------------|---------|
| Splash | App launch | Branding and initial load |
| Login | Pre-auth | User authentication (UI) |
| Services | Main tab 0 | Discover and search home services |
| Service Booking | From Services | Schedule a worker visit |
| Shop | Main tab 1 | Browse tools and appliances |
| Product Detail | From Shop | View product info and purchase |
| Orders | Main tab 2 | Track service and product orders |
| Profile | Main tab 3 | Account settings and preferences |

Navigation is handled by `MainShell`, which uses a bottom navigation bar with four primary tabs: **Services**, **Shop**, **Orders**, and **Profile**.

---

## Roadmap

- [ ] Backend API (REST/GraphQL) with authentication and authorization
- [ ] Real-time inventory and dealer integrations
- [ ] Payment gateway integration
- [ ] Worker app with on-site parts ordering
- [ ] Sellers / Dealer portal (web)
- [ ] Push notifications for booking and delivery updates
- [ ] Provider verification and ratings system
- [ ] Admin dashboard and analytics

---

---

<p align="center">
  <strong>Fix It Force</strong> — Streamlining repair, maintenance, and hardware commerce.
</p>
