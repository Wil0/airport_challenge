require "./lib/airport.rb"
require "./lib/weather.rb"
require "./lib/plane.rb"

p airport = Airport.new
p plane = Plane.new

# p airport.land(plane)
# fail "plane is not landing" unless airport.land(plane) == [plane]
# p airport.take_off(plane)
