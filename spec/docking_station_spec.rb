require 'docking_station.rb'

describe DockingStation do

  subject { DockingStation.new }

  let(:working_bike) { double :working_bike , broken?: false , working?: true }
  let(:broken_bike) { double :broken_bike, report_broken: true, broken?: true, working?: false }

  describe 'initialization' do

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(working_bike)
      end
      expect{ subject.dock(working_bike) }.to raise_error 'This docking station is full'
    end
  end

  describe '#release_bike' do

    it 'releases a working bike' do
      subject.dock(working_bike)
      expect(subject.release_bike).to be_working
    end

    it 'does not release broken bikes' do
      subject.dock(broken_bike)
      expect{subject.release_bike}.to raise_error "There are no bikes available"
    end

    it 'docks two bikes, one working and one broken, and releases the working bike' do
      subject.dock(working_bike)
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect(subject.release_bike).to be working_bike
    end

    it 'raises error when no bikes available' do
      expect{subject.release_bike}.to raise_error "There are no bikes available"
    end

  end

  describe '#dock' do

    it 'docks a bike' do
     expect(subject.dock(working_bike)).to eq [working_bike]
    end

    it 'raises error when trying to dock a bike in a full docking station' do
      # DockingStation::DEFAULT_CAPACITY.times {subject.dock(working_bike)}
      subject.capacity.times {subject.dock(working_bike)}
      expect{subject.dock(working_bike)}.to raise_error "This docking station is full"
    end

    it 'docks any bike even if it is broken' do
      broken_bike.report_broken
      expect(subject.dock(broken_bike)).to eq [broken_bike]
    end

  end

  # it 'returns docked bike' do
  #   subject.dock(working_bike)
  #   expect(subject.bikes).to eq [working_bike]
  # end

  it 'initializes with a capacity argument' do
    station = DockingStation.new 50
    expect(station.capacity).to eq 50
  end

end
