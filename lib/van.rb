require_relative 'docking_station'

class Van

  def collect_broken_bikes(station)
    station.bikes.select { |bike| bike.broken == true }
  end

end
