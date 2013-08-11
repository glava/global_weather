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
		(Nokogiri.XML @body).children.xpath('//NewDataSet/Table').map do |node|
				{
					:county => node.children.first.inner_text,
					:city => node.children.last.inner_text,
				}
		end
	end
end