require 'minitest/autorun'
require '../lib/weather'
require '../lib/plane'

	class WeatherClass
	include Weather
end

	class WeatherTest < MiniTest::Unit::TestCase

  class AirportTest

  def setup
    @airport = Airport.new    
    @runway = Runway.new
    @plane = Plane.new
    @weather = Weather.new
  end
 
  def test_plane_can_land   
		assert @runway.empty?
		@runway.use(@plane)
		refute @runway.empty?
	end
 
  #A plane currently in the airport can be requested to take off.
  def test_plane_can_take_off
    @runway.land(@plane)
    @runway.takeoff(@plane)
  end
 
  # No more planes can be added to the airport, if it's full.
  # It is up to you how many planes can land in the airport and how that is impermented.
  def test_no_planes_can_be_added_to_airport_if_full
      assert_equal 6, @runway.capacity
      @runway.capacity = 6
      assert_equal 6, @runway.capacity  
  end
 
  # If the airport is full then no planes can land
  def test_that_plane_can_land_after_airport_is_full_and_a_take_off_happened
      assert_equal 6, @runway.capacity
      @runway.capacity = 6
      assert_equal 6, @runway.capacity  
  end
 
  # When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
  def test_plane_has_a_flying_status_after_it_is_created
    @plane.status(@plane)
    plane = @plane.flying_status
    assert_equal [@plane], plane
  end

  # When we land a plane at the airport, the plane in question should have its status changed to "landed"
  def test_plane_has_a_landed_status_after_landing    
    @plane.status(@plane)
    plane = @plane.landed_status
    assert_equal [@plane], plane
  end
 
  # When the plane takes of from the airport, the plane's status should become "flying"
  def test_plane_has_a_flying_status_after_take_off
    @plane.status(@plane)
    plane = @plane.flying_status
    assert_equal [@plane], plane
  end
 
  def test_that_no_plane_can_take_off_with_a_storm_brewing
    @weather.status(@weather)
    plane << plane unless storm_brewing
  end
 
  # As with the above test, if the airport has a weather condition of stormy,
  # the plane can not land, and must not be in the airport
  def test_that_no_plane_can_land_when_there_is_a_storm_brewing
    @weather.status(@weather)
    plane << plane unless stormy
  end
 
  # grand final
  # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
  # Be careful of the weather, it could be stormy!
  # Check when all the planes have landed that they have the right status "landed"
  # Once all the planes are in the air again, check that they have the status of flying!
  def test_all_planes_can_land_then_all_planes_in_airport_can_takeoff   
    @plane.flying(@plane)
    @plane.land(@plane)
      @plane.take_off(@plane)
      @plane.flying(@plane)
    plane = @plane.flying_status
    assert_equal [@plane], plane
  end
end