# NewsApp Flutter

Flutter NewsApp is a modern news application built using the Flutter framework. It fetches the latest news articles from various sources using the NewsAPI.org and displays them in an attractive and user-friendly interface.

## Features

- **Breaking News:** Display the latest breaking news.
- **Trending News:** Display the most trending news.
- **Favorite Articles:** Save articles to a favorite list and view them later.
- **Detailed News View:** View detailed information about a news article.
- **Pull to Refresh:** Refresh the news feed by pulling down the screen.

## Screenshots

<img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/1.jpeg" alt="Shimmer Image" width="260">    <img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/2.jpeg" alt="Home Page" width="260">    <img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/3.jpeg" alt="Details" width="260">    <img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/4.jpeg" alt="Added to Favorite" width="260">    <img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/5.jpeg" alt="Favorite List" width="260">    <img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/6.jpeg" alt="Breaking News" width="260">    <img src="https://github.com/thisiskritartha/NewsApp-Flutter/blob/main/assets/screenshots/7.jpeg" alt="Trending News" width="260">

## Installation

To run this project locally, follow these steps:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/thisiskritartha/NewsApp-Flutter.git
    cd NewsApp-Flutter
    ```

2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Run the app:**
    ```bash
    flutter run
    ```

    Or you can directly download the apk from the given link: `https://drive.google.com/drive/folders/1BHTRthLV9gw-wce93kdUBREosMvYCUjp?usp=sharing`

## Dependencies

This project uses the following dependencies:

- `flutter`
- `get`
- `cached_network_image`
- `carousel_slider`
- `shimmer`
- `flutter_screenutil`
- `http`

## API Integration

The application uses the [NewsAPI.org](https://newsapi.org) to fetch the latest news articles. You will need to obtain an API key from NewsAPI.org and add it to your project.


## Usage

### HomeController

The `HomeController` manages the state of the home page. It fetches the breaking and trending news articles and provides functions to view all articles in each category.

### Favorite Articles

Users can save articles to a favorite list. This list is managed using the `Controller`, which allows users to add, remove, and clear articles from their favorites.

### DetailedPage

The `DetailedPage` displays the detailed information of a selected news article. It includes the title, description, and image of the article.




