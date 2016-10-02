require 'garage'

describe Garage do

  subject(:garage) { described_class.new }
  let(:van) { double :van, dock: bike}
  let(:bike) { double :bike , fix: true, working?: true }

  describe'#dock' do
    it "accepts bikes" do
      garage.dock(bike)
      expect(garage.bikes).to include bike
    end
  end

  describe '#release_fixed_bikes' do
    it "releases bikes" do
      garage.dock(bike)
      garage.release_fixed_bikes(van)
      expect(garage.bikes).to be_empty
    end

    it 'fixes bikes' do
      garage.dock(bike)
      expect(bike).to receive(:fix)
      garage.release_fixed_bikes(van)
    end
  end

end
