require 'van'

describe Van do

  subject(:van) { described_class.new }
  let(:garage) { double :garage, dock: broken_bike }
  let(:station) { double :docking_station, dock: bike, release_broken_bikes: [broken_bike] }
  let(:broken_bike) { double :bike, working?: false}
  let(:bike) { double :bike , working?: true }

  describe '#dock' do

    it 'collects broken bikes from docking station' do
      van.dock(broken_bike)
      expect(van.bikes).to include broken_bike
    end

  end

  describe '#release_broken_bikes' do

    it 'delivers bikes to garage' do
      van.dock(broken_bike)
      van.release_broken_bikes(garage)
      expect(van.bikes).to be_empty
    end
  end

  describe '#release_fixed_bikes' do
    it 'only releases working bikes' do
      van.dock(broken_bike)
      van.release_fixed_bikes(station)
      expect(van.bikes).to include broken_bike
    end

    it 'removes fixed bikes from inventory' do
      van.dock(bike)
      van.release_fixed_bikes(station)
      expect(van.bikes).to be_empty
    end
  end

end
