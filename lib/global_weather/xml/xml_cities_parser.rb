require 'global_weather/model/city'
# Response XML parser for cities request.
#
# Converts xml from service to array of City objects or 
# to array of hash maps.
# 
# 
# @author [goran]
class XMLCitiesParser

  attr_reader :xml
  
  def initialize(xml)
    @xml = xml
  end

  def to_cities
    to_hash.map{|params| City.new(params)}
  end

  def to_hash
    (Nokogiri.XML @xml).search('Table').map do |node|
        {
          :country => node.at('Country').inner_text,
          :city => node.at('City').inner_text
        }
    end
  end
end