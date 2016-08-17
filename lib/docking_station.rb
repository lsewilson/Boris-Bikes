require './lib/bike.rb'
class DockingStation
  attr_reader :bike

  def release_bike
    Bike.new

  end

  def dock(bike) # this method act of docking bike in station
  @bike = bike
  end

  def bike
    @bike
  end

end
