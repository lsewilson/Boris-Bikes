require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if @bikes.length == 0
    @bikes
  end

  def dock_bike(bike)
    fail "This docking station is full" if @bikes.length >= 20
    @bikes << bike
  end

end
