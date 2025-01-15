# News App

A Flutter application that displays news articles from [newsapi.org](https://newsapi.org/).

## Features

- Display top headlines
- Display breaking news
- Browse news by category
- View detailed news articles
- Carousel slider for featured news
- Smooth page indicator for carousel
- Cached network images for better performance

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine
- An API key from [newsapi.org](https://newsapi.org/)

### Installation

1. Clone the repository:
2. Create a .env file in the root directory and add your API key:
 - apiKey=YOUR_API_KEY      #I have used dotEnv for handeling .env file.
3. Install dependencies:
 - flutter pub get
4. Run the app:
 - flutter run

# Project Structure

lib/
├── components/          # Reusable UI components
├── models/              # Data models
├── screens/             # Screen widgets
│   ├── home/            # Home screen
│   ├── details/         # Details screen
│   └── view_all/        # View all screen
├── services/            # API services and data fetching
├── widget/              # Custom widgets
├──             # Entry point of the application
└── ...

## Dependencies
 - flutter
 - flutter_dotenv
 - http
 - carousel_slider
 - smooth_page_indicator
 - cached_network_image
## Contributing

 - Contributions are welcome! Please open an issue or submit a pull request for any changes.