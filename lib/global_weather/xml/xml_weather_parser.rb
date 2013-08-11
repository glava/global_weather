require 'global_weather/model/weather'
class XMLWeatherParser

	attr_reader :body, :city, :country
	
	def initialize(city, country, body)
		@body = body
		@city = city
		@country = country
	end

	def to_weather
		Weather.new to_hash
	end

	def to_hash
		(Nokogiri.XML @body).search('CurrentWeather').map{|node| 
			 {      :wind => node.at('Wind').inner_text,
				 	:visibility => node.at('Visibility').inner_text,
				 	:skyConditions => node.at('SkyConditions').inner_text,
				 	:temperature => node.at('Temperature').inner_text,
				 	:dewPoint => node.at('DewPoint').inner_text,
				 	:relativeHumidity => node.at('DewPoint').inner_text,
				 	:pressure => node.at('Pressure').inner_text,
				 	:status => node.at('Status').inner_text,
				 	:time => node.at('Time').inner_text,
				 	:city => @city,
				 	:country => @country
				}
		}.first

	end
end