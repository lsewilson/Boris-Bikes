require 'van'

describe Van do

  let(:broken_bike) { double :broken_bike, report_broken: true, broken: true, working?:false }
  let(:bike) { double :bike, broken: false, working?: true }
  let(:station) { double :station, dock_bike: true, bikes: [broken_bike, bike, bike, bike] }
  let(:garage) { double :garage, bikes: [bike, bike, bike] }


  describe '#collect_broken_bikes' do

    it 'should collect broken bikes from the docking station' do
      expect(subject.collect_broken_bikes(station)).to eq [broken_bike]
    end

  end

  describe '#deliver' do

    it 'should deliver all broken bikes in van to garage' do
        subject.collect_broken_bikes(station)
        expect(subject.deliver).to eq [broken_bike]
    end

  end

  describe '#collect_fixed_bikes' do
    it 'should collect fixed bikes from a garage' do

      expect(subject.collect_fixed_bikes(garage)).to eq bikes
    end
  end


end
