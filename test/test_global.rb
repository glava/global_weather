require 'test/unit'
require 'global_weather'

class GlobalWeatherTest < Test::Unit::TestCase
  
  def test_soap_client_return
    assert_equal "hello world",
      GlobalWeather.get_soap_client
  end
end