require '../lib/weather.rb'
class runway
	include weather

CAPACITY = 6

	def setup
    @airport = Airport.new    
    @runway = Runway.new
    @plane = Plane.new
    @weather = Weather.new
  end

	def land(plane)
		raise "The plane can land if the runway is empty" if full?
		plane << plane unless full?
	end

	def takeoff(plane)
		raise "The plane can take off if it is cleared" if not_cleared?
		plane << plane unless not_cleared?
	end

	def add_more_planes?
		plane_count == capacity
	end

	def land_more_planes?
    	plane_count == capacity
  	end
	
end