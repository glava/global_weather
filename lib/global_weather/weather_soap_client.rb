require 'savon'
require 'global_weather/xml/xml_weather_parser'
require 'global_weather/xml/xml_cities_parser'
require 'global_weather/exception/data_not_found_exception'
 
# Wrapper around weather soap service
# 
# @author [goran]
class WeatherSoapClient
  attr_reader :client
  
  def initialize(client)
    @client = client
  end

  # Returns weather forcast for passed city and country
  # @param  city [String] City name
  # @param  country [String] Country name
  # 
  # Throws DataNotFoundException in case that forcast
  # can't be found
  # 
  # @return [Weather] weather forcast
  def weather(city, country)
    response = client.call( 
      :get_weather, message: { 'CityName' => city, 'CountryName' => country })
    if response.success?
      if response.body[:get_weather_response][:get_weather_result] == "Data Not Found"
        raise DataNotFoundException.new(
          "Data can't be found for #{city} and #{country}")
      else
        XMLWeatherParser.new(
          city, country, response.body[:get_weather_response][:get_weather_result]
          ).to_weather
      end
    end
  end
    
  # Returns cities for passed country
  # @param  country [String] Name of the country
  # 
  # Returns empty list if country is not found.
  # 
  # @return [Array] List of City objects
  def cities(country)
    response = client.call(:get_cities_by_country, 
      message: { 'CountryName' => country })
    if response.success?
      XMLCitiesParser.new(
        response.body[:get_cities_by_country_response][:get_cities_by_country_result]
        ).to_cities
    end
  end

end
