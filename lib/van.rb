# accepts broken bikes from docking station
# has a capacity limit
# deliver bikes to a garage
# collects bikes from garage

class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def release_broken_bikes(garage)
    @bikes.each do |bike|
      garage.dock(bike) if !bike.working?
    end
    @bikes.reject!{|bike| !bike.working?}
  end

  def release_fixed_bikes(station)
    @bikes.each do |bike|
      station.dock(bike) if bike.working?
    end
    @bikes.reject!{|bike| bike.working?}
  end

end
