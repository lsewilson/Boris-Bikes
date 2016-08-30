require 'docking_station'
require 'bike'

describe DockingStation do

  it "when asking DockingStation to release_bike, a bike is released" do
    expect(subject).to respond_to(:release_bike)
  end

  it "released working bikes" do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  describe '#dock(bike)' do
    it 'docks bike at docking station' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises error when docking a bike in a full dock' do
      bike = Bike.new
      20.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error 'Dock full'
    end

  end

  it 'returns docked bike instance when asked .bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe "#release_bike" do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error when releasing bike from empty docking station' do
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end

end
