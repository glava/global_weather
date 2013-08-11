require "global_weather/version"
require 'global_weather/weather_soap_client'

module GlobalWeather
   
   @soap_client = WeatherSoapClient.new('http://www.webservicex.net/globalweather.asmx?WSDL')

   def self.weather(city, country)
   	 @soap_client.weather(city, country)
   end

end
