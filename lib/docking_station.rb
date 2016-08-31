require_relative 'bike'

class DockingStation

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if empty?
    working_bikes.shift #bikes.pop
  end

  def dock(bike)
    fail "This docking station is full" if full?
    @bikes << bike
  end

private

attr_reader :bikes

  def full?
    @bikes.count >= capacity
  end

  def empty?
    working_bikes.count == 0 #bikes.empty?
  end

  def working_bikes
    @bikes.select {|bike| !bike.broken?}
  end

end
