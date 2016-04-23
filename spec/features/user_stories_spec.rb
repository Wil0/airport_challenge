describe 'user stories' do
  it 'instructs a plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    expect{ airport.land(plane) }.not_to raise_error
  end

  it 'instructs planes to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it 'prevents plane from landing when the airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.land(plane)
    end
    expect {airport.land(plane)}.to raise_error "Cannot land plane: airport full"
    end
end
