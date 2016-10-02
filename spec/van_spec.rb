require 'van'

describe Van do

  subject(:van) { described_class.new }
  let(:garage) { double :garage }
  let(:station) { double :docking_station, release_broken_bikes: [broken_bike] }
  let(:broken_bike) { double :bike, working?: false}

  describe '#collect_bikes' do

    it 'collects broken bikes from docking station' do
      van.collect_broken_bikes(station)
      expect(van.bikes).to include broken_bike
    end

  end

end
