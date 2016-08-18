require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    working_bikes = @bikes.select {|bike| bike.broken == false}
    fail "There are no bikes available" if working_bikes == [] || empty?
    working_bikes.shift
  end

  def dock_bike(bike)
    fail "This docking station is full" if full?
    @bikes << bike
  end

private

  def full?
    @bikes.length >= capacity
  end

  def empty?
    @bikes.length == 0
  end

end
