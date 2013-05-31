class Plane
	include weather

CAPACITY = 6

	def setup
    @airport = Airport.new    
    @runway = Runway.new
    @plane = Plane.new
    @weather = Weather.new
  end

	def flying_planes
    planes.reject {|plane| plane.landed? }
  end

  def landed_plane
    planes.reject {|plane| plane.flying? }
  end

	def plane_can_take_off	
		@plane.landed(@plane)
		@plane.takeoff(@plane)
	end

	def no_planes_can_be_added_to_airport_if_full
		assert_equal 6, @airport.capacity
		@airport.capacity = 6
		assert_equal 6, @airport.capacity		
	end
 
  def plane_can_land_after_airport_is_full_and_a_take_off_has_happened
      assert_equal 6, @runway.capacity
      @runway.capacity = 6
      assert_equal 6, @runway.capacity  
  end
 
  def plane_has_a_flying_status_after_it_is_created
    if @plane = new_plane
    	puts "This plane has flying status"
   end

  def plane_has_a_landed_status_after_landing    
    if @plane = landed_plane
    	puts "This plane has landed"
   end

  def plane_has_a_flying_status_after_take_off
    if @plane = flying
    	puts "This plane has the status flying"  
  end
 
  def no_plane_can_take_off_with_a_storm_brewing
 			if @weather == storm_brewing
 				puts "planes can't take off because there is a storm brewing"
	end

 def no_plane_can_land_when_there_is_a_storm_brewing
    if @weather == storm_brewing
        raise "planes can't land as it is stormy"
    plane << plane unless stormy
  end

  def planes_can_land_then_all_planes_in_airport_can_takeoff   
    @plane.landed(@plane)
    @plane.takeoff(@plane)
    plane = @plane.flying_status
    assert_equal [@plane], plane
  end
end