class GlobalWeatherException < Exception

  def initialize(message)
    @message = message
  end

end