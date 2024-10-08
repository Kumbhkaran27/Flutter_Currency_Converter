# Currency Convertor App - Flutter 

## Introduction

A **Flutter** currency convertor app designed to provide users a facility to exchange the currencies rates. It uses an API to display the exchanged data.

## Features

- Exchnage the currencies.
- Swap the desired currencies.
- User-friendly minimal interface.

## Getting Started

Follow these steps to get the app up and running:

1. Clone the repository: `git clone https://github.com/saadshd/Flutter-Currency-Convertor.git`
2. Install dependencies: `flutter pub get`
3. Add OpenWeatherMap API KEY on lib/res/key.dart `const Key = '<YOUR API KEY>';`
4. Run the app: `flutter run`

## API Key

The app integrates with a weather API to fetch weather data. The API key should be placed in the `lib/res/key.dart` file. You can obtain an API key by signing up on the [Open Exchange Rates API](https://openexchangerates.org/) website. Must use your own API key.

## Dependencies

- [Http](https://pub.dev/packages/http) - For making HTTP requests to the currency API.


