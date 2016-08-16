require './lib/docking_station.rb'
require './lib/bike.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike}

  it 'instances of DockingStation respond to working?' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  # it 'has bikes available at DockingStation' do
  #
  # end

end
