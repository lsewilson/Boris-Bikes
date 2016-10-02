# accepts broken bikes from docking station
# has a capacity limit
# deliver bikes to a garage
# collects bikes from garage

class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(station)
    station.release_broken_bikes.each do |bike|
      @bikes << bike
    end 
  end

end
