require 'global_weather/model/city'
class XMLCitiesParser

	attr_reader :body
	
	def initialize(body)
		@body = body
	end

	def to_cities
		to_hash.map{|params| City.new(params)}
	end

	def to_hash
		(Nokogiri.XML @body).search('Table').map do |node|
				{
					:country => node.at('Country').inner_text,
					:city => node.at('City').inner_text
				}
		end
	end
end