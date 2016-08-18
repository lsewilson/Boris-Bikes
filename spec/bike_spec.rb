require 'bike.rb'

describe Bike do

  it {is_expected.to respond_to :working?}

  it {is_expected.to respond_to :report_broken}

  it 'reports bike as broken' do
    expect(subject.report_broken).to eq "This bike is broken!"
  end

end
