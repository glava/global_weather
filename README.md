# GlobalWeather

GlobalWeather is a wrapper gem around SOAP service for weather forecast.

## Installation

First you need to build it, so run this inside of gem directory
	
	rake build

Then install it
	
	rake install

Add this line to your application's Gemfile:

    gem 'global_weather'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install global_weather

## Dependencies

This gem uses savon for SOAP communication.

	gem 'savon'

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
