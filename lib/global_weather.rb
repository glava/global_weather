require "global_weather/version"
require 'global_weather/weather_soap_client'

module GlobalWeather
   
   WSDL_URL = 'https://api.taxcloud.net/1.0/?wsdl'

   @soap_client = WeatherSoapClient.new(Savon.client(wsdl: 'http://www.webservicex.net/globalweather.asmx?WSDL'))

   def self.weather(city, country)
   	 @soap_client.weather(city, country)
   end

   def self.cities(country)
   	@soap_client.cities(country)
   end

end
