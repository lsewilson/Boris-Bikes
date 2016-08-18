require 'bike.rb'

describe Bike do

  it {is_expected.to respond_to :working?}

  it {is_expected.to respond_to :report_broken}

  it 'reports bike as broken' do
    expect(subject.report_broken).to eq true
  end

  describe '#working' do
    it 'reflects true state of bike' do
      subject.report_broken
      expect(subject.working?).to eq false
    end
  end

end
