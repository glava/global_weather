require 'spec_helper'

describe WeatherSoapClient do

  let(:client){WeatherSoapClient.new(
    Savon.client(wsdl: 'http://www.webservicex.net/globalweather.asmx?WSDL'))}

  it "should be initialized with savon client" do
    client.should_not eql nil
  end

  it "should retrun weather for passed exsiting city {Berlin}" do
    VCR.use_cassette('weather_berlin') do
      client.weather('Berlin', 'Germany').should be_kind_of(Weather)
    end
  end

  it "should raise DataNotFound exception if bad city" do
    VCR.use_cassette('weather_non_existing_city') do
      expect{
        client.weather('Berlin22', 'Germany').city.should eql "Berlin"
      }.to raise_error
    end
  end
  
  it "should raise DataNotFound exception if bad country" do
    VCR.use_cassette('weather_non_existing_country') do
      expect{
        client.weather('Berlin', 'Germanyww').city.should eql "Berlin"
      }.to raise_error
    end
  end

  it "should return cities for passed country" do
    VCR.use_cassette('cities_germany') do
      client.cities('Germany').size.should be > 0
    end
  end

  it "should return list of city objects" do
    VCR.use_cassette('cities_germany') do
      cities = client.cities('Germany')
      cities.first.country.should eql "Germany"
      cities.first.should be_kind_of(City)
    end
  end

  it "should return empty array for bad city" do
    VCR.use_cassette('bad_cities_request') do
      client.cities('Germanyss').size.should eql 0
    end
  end

end