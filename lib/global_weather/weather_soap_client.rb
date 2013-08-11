require 'savon'
	class WeatherSoapClient
		attr_reader :client

		def initialize(wsd_link)
			@client = Savon.client(wsdl: wsd_link)
		end

		def weather(city, country)
			response = client.call(
				:get_weather, 
				message: { 'CityName' => city, 'CountryName' => country })
			if response.success?
				to_weather_hash response.body[:get_weather_response][:get_weather_result]
			end
		end

		def cities(country)
			response = client.call(:get_cities_by_country, message: { 'CountryName' => country })
			if response.success?
				 to_city_hash response.body[:get_cities_by_country_response][:get_cities_by_country_result]
			end
		end

		private

		def to_city_hash(body)
			(Nokogiri.XML body).children.xpath('//NewDataSet/Table').map do |node|
				{
					:county => node.children.first.inner_text,
					:city => node.children.last.inner_text,
				}
			end
		end
		
		def to_weather_hash(body)
			(Nokogiri.XML body).children.xpath('//CurrentWeather').map do |node|
				 {  :wind => node.xpath('//Wind').inner_text,
				 	:visibility => node.xpath('//Visibility').inner_text,
				 	:skyConditions => node.xpath('//SkyConditions').inner_text,
				 	:temperature => node.xpath('//Temperature').inner_text,
				 	:dewPoint => node.xpath('//DewPoint').inner_text,
				 	:relativeHumidity => node.xpath('//DewPoint').inner_text,
				 	:pressure => node.xpath('//Pressure').inner_text,
				 	:status => node.xpath('//Status').inner_text,
				 	:time => node.xpath('//Status').inner_text
				 }
			end
		end
end
