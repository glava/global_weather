# City
# Holds info about name and country
# 
# @author [goran]
class City
  attr_reader :name, :country

  def initialize(params)
    @name = params[:city]
    @country = params[:country]
  end
  
end