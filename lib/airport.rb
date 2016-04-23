require_relative 'weather'
class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end
  def land (plane)
    raise "Cannot land plane: airport full" if full?
    raise "Cannot land plane when weather is stormy" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off plane: stormy weather" if stormy?
    raise "Plane not at the airport" if landed?(plane)
  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    Weather.new.stormy?
  end

 def landed?(plane)
   @planes.include?(plane)
 end

end
