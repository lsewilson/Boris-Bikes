require_relative 'docking_station'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(station)
    bikes  = station.bikes.select { |bike| bike if bike.broken == true }
  end

  def collect_fixed_bikes(garage)
    garage.bikes.each { |bike| bikes.push(bike) }
  end

  def deliver
    bikes
  end

end
