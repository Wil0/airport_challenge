describe 'user stories' do

  it 'has a default capacity' do
    airport_default = Airport.new
    plane = Plane.new
    allow(airport_default).to receive(:stormy?).and_return false
    Airport::DEFAULT_CAPACITY.times { airport_default.land(plane) }
    expect { airport_default.land(plane) }.to raise_error "Cannot land plane: airport full"
  end

  it 'instructs a plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect{ airport.land(plane) }.not_to raise_error
  end

  it 'instructs planes to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it 'takes off planes from the airport they are at' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    expect { airport.take_off(plane) }.to raise_error "Plane not at the airport"

  end

  context 'when airport is full' do
    it 'prevents plane from landing' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      20.times do
        airport.land(plane)
      end
      expect {airport.land(plane)}.to raise_error "Cannot land plane: airport full"
    end
  end

  context 'when stormy weather' do
    let(:airport) {Airport.new(20)}
    let(:plane) {Plane.new}

    it 'does not allow planes to land when stormy weather' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "Cannot land plane when weather is stormy"
    end
    it 'does not allow plane to take_off' do
      allow(airport).to receive(:stormy?).and_return true
      expect {airport.take_off(plane) }.to raise_error "Cannot take off plane: stormy weather"
    end
  end
end
