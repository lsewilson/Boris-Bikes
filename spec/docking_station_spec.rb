require 'docking_station.rb'

describe DockingStation do

  it {is_expected.to respond_to :release_bike}

  it 'gets a bike from docked bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'releases a working bike' do
    subject.dock_bike(Bike.new)
    expect(subject.release_bike).to be_working
  end

  it 'Raises error when no bike available' do
    expect{subject.release_bike}.to raise_error "There are no bikes available"
  end

  it {is_expected.to respond_to(:dock_bike).with(1).argument}

  it 'docks a bike' do
   bike = Bike.new
   expect(subject.dock_bike(bike)).to eq [bike]
  end

  it 'Raises error when trying to dock a bike in a full docking station' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(Bike.new)}
    bike = Bike.new
    expect{subject.dock_bike(bike)}.to raise_error "This docking station is full"
  end

  it {is_expected.to respond_to :bikes}

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes).to eq [bike]
  end

end
