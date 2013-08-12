require 'spec_helper'

describe Weather do

  let(:client){WeatherSoapClient.new(
    Savon.client(wsdl: 'http://www.webservicex.net/globalweather.asmx?WSDL'))}

  context "when trying to fetch weather" do
    
    before do
      VCR.use_cassette('weather_berlin') do
        @weather = client.weather('Berlin', 'Germany')
      end
    end
    
    it "should contain with same city passed" do
      @weather.city.should eql "Berlin"
    end

    it "should contain country passed" do
      @weather.country.should eql "Germany"
    end

    it "should contain wind" do
      @weather.wind.should_not eql nil
      @weather.wind.should be_kind_of String
    end

    it "should contain visibility" do
      @weather.visibility.should_not eql nil
      @weather.visibility.should be_kind_of String
    end

    it "should contain skyConditions" do
      @weather.skyConditions.should_not eql nil
      @weather.skyConditions.should be_kind_of String
    end

    it "should contain temperature" do
      @weather.temperature.should_not eql nil
      @weather.temperature.should be_kind_of String
    end

    it "should contain dewPoint" do
      @weather.dewPoint.should_not eql nil
      @weather.dewPoint.should be_kind_of String
    end

    it "should contain relativeHumidity" do
      @weather.relativeHumidity.should_not eql nil
      @weather.relativeHumidity.should be_kind_of String
    end

    it "should contain pressure" do
      @weather.pressure.should_not eql nil
      @weather.pressure.should be_kind_of String
    end

    it "should time time" do
      @weather.time.should_not eql nil
      @weather.time.should be_kind_of String
    end

  end
  
end