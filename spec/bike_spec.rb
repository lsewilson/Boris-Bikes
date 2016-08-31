require 'bike.rb'

describe Bike do

  it 'reports bike as broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
