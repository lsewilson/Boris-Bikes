require 'bike'

describe Bike do

  subject(:bike) { described_class.new }

  describe '#working?' do
    it 'returns true' do
      expect(bike.working?).to equal true
    end
  end

  describe '#report_broken' do
    it 'changes status of bike to broken' do
      bike.report_broken
      expect(bike.working?).to equal false
    end

  end
end
