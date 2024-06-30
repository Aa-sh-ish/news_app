# News App

A new Flutter project for browsing news articles.

## Description

This project is a news app built using Flutter. It fetches news articles from an API and displays them with features such as infinite scrolling, splash screen, and easy URL launching.

## Getting Started

### Prerequisites

- Flutter SDK: `>=3.2.0 <4.0.0`


### Installation

1. **Clone the repository:**

    git clone https://github.com/Aa-sh-ish/news_app.git
    cd news_app


2. **Install dependencies:**

    flutter pub get


3. **Run the app:**

    flutter run


### Dependencies

This project uses the following dependencies:

- **flutter_bloc**: ^8.1.6
- **flutter_screenutil**: ^5.9.3
- **shimmer**: ^3.0.0
- **auto_size_text**: ^3.0.0
- **infinite_scroll_pagination**: ^4.0.0
- **http**: ^1.2.0
- **another_flutter_splash_screen**: ^1.2.1
- **easy_url_launcher**: ^0.0.7


### File structure
/lib
-main.dart
-commom
    - blocs
    - routes
    - utils
    - widgets
        - appstyle
        - navigation bar
        - heighspacer
        - shimmererror
        - reusable text
- core
    - models
        - article model
    - pages
        - Bookmark
            Bookmark.dart
            cubits
            widgets
        - HomePage
            homepage.dart
            cubits
            widgets
        - profile
            profile.dart
        - splashscreen
            splashscreen.dart

