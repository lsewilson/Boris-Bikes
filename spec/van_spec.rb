require 'van'

describe Van do

  it { is_expected.to respond_to :collect_broken_bikes }

  describe '#collect_broken_bikes' do

    # let(:broken_bike) { double :broken_bike, report_broken: true, broken: true, working?:false }
    # let(:station) { double :station, dock_bike: true, bikes:  }

    it 'should collect broken bikes from the docking station' do
      bike_broken = Bike.new
      station = DockingStation.new
      bike_broken.report_broken
      station.dock_bike(bike_broken)
      10.times do
        bike = Bike.new
        station.dock_bike(bike)
      end
      expect(subject.collect_broken_bikes(station)).to eq [bike_broken]
    end

  end

  describe '#deliver' do

    it 'should deliver all broken bikes in van to garage' do
        bike = Bike.new
        station = DockingStation.new
        bike.report_broken
        station.dock_bike(bike)
        subject.collect_broken_bikes(station)
        expect(subject.deliver).to eq [bike] 
    end

  end


end
