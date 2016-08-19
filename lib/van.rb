require_relative 'docking_station'

class Van

  def collect_broken_bikes(station)
    @van_bikes  = station.bikes.select { |bike| bike if bike.broken == true }
  end

  def deliver
    @van_bikes
  end

end
