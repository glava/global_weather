class GlobalWeatherException < StandardError

  def initialize(message)
    @message = message
  end

end