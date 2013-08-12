# GlobalWeather

GlobalWeather is a wrapper gem around SOAP service for weather forecast.

## Installation

Add this line to your application's Gemfile:

    gem 'global_weather'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install global_weather

## Usage

There are two methods on SOAP service 

To fetch cities 

```
 GlobalWeather.cities('Germany')
```

And to fetch weather

```
 GlobalWeather.weather('Berlin', Germany')
```
