require 'airport'
describe Airport do
  subject(:airport) {described_class.new(20)}
  let(:plane) {double :plane}

  it 'has a default capacity' do
    airport_default = Airport.new
    allow(airport_default).to receive(:stormy?).and_return false
    described_class::DEFAULT_CAPACITY.times { airport_default.land(plane) }
    expect {airport_default.land(plane) }.to raise_error "Cannot land plane: airport full"

  end

  describe '#land' do
    it 'instructs planes to land' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end
    context 'when airport full' do
      it' does not allow landing' do
        allow(airport).to receive(:stormy?).and_return false
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end
    context 'when stormy' do
      it 'does not allow planes to land' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane when weather is stormy"
      end
    end
  end

  describe '#take_off' do
    it 'instructs planes to take off' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'takes off planes that are at the airport' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane not at the airport"
    end

    context 'when stormy weather' do
      it 'does not allow planes to land' do
        allow(airport).to receive(:stormy?).and_return true
        expect { (airport.take_off(plane)) }.to raise_error "Cannot take off plane: stormy weather"
      end
    end
  end
end
