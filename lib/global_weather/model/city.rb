class City
	attr_reader :city, :country

	def initialize(params)
		@city =params[:city]
		@country =params[:country]
	end
end