class Weather
	attr_reader :city, :country, :wind, :visibility, :skyConditions
	attr_reader :temperature,:dewPoint,:relativeHumidity, :pressure, :status, :time  

	def initialize(params)
		unless(params.nil?)
			@city =params[:city]
			@country =params[:country]
			@wind = params[:wind]
			@visibility = params[:visibility]
			@skyConditions = params[:skyConditions]
			@temperature = params[:temperature]
			@dewPoint = params[:dewPoint]
			@relativeHumidity = params[:relativeHumidity]
			@pressure = params[:pressure]
			@time = params[:time]
		end
	end
end