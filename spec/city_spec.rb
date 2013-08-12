require 'spec_helper'

describe City do

  let(:client){WeatherSoapClient.new(
    Savon.client(wsdl: 'http://www.webservicex.net/globalweather.asmx?WSDL'))}

  context "when trying to fetch city" do
    
    before do
      VCR.use_cassette('cities_germany') do
        @city = client.cities('Germany').first
      end
    end

    it "should contain name" do
      @city.name.should_not eql nil
      @city.name.should be_kind_of String
    end

    it "should contain country passed" do
      @city.country.should eql "Germany"
    end
  
  end
  
end