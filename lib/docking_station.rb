require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail "This docking station is full" if full?
    @bikes << bike
  end

private

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.length == 0
  end

end
