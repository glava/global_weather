require "global_weather/version"
require 'global_weather/weather_soap_client'

module GlobalWeather
   
   def self.get_soap_client
   	 WeatherSoapClient.new('http://www.webservicex.net/globalweather.asmx?WSDL')
   end

end
