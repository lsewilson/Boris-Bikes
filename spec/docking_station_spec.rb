require 'docking_station'

describe DockingStation do
  subject(:station) { described_class.new }
  let(:bike) { double :bike, working?: true }
  let(:broken_bike) { double :bike, working?: false }

  it 'initializes with a default capacity' do
    expect(station.capacity).to equal DockingStation::DEFAULT_CAPACITY
  end

  describe '#dock' do

    it 'fails if the docking station is at capacity' do
       DockingStation::DEFAULT_CAPACITY.times do
         station.dock(bike)
       end
       msg = "There are no spaces available"
       expect {station.dock(bike)}.to raise_error msg
    end

    it 'accepts a broken bike' do
      expect{station.dock(broken_bike)}.not_to raise_error
    end
  end

  describe '#release_bike' do
    it 'returns a working bike' do
      station.dock(bike)
      expect(station.release_bike).to equal bike
    end

    it 'fails if there are no bikes available' do
      msg = "There are no working bikes available"
      expect{station.release_bike}.to raise_error msg
    end

    it 'does not release a broken bike' do
      station.dock(broken_bike)
      msg = "There are no working bikes available"
      expect{station.release_bike}.to raise_error msg
    end

  end

  # describe '#release_broken_bikes' do
  #   it 'releases all broken bikes' do
  #     station.dock(broken_bike)
  #     expect(station.release_broken_bikes).to equal [broken_bike]
  #   end
  # end

end
