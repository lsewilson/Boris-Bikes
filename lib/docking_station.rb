class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail "There are no spaces available" if full?
    @bikes << bike
  end

  def release_bike
    fail "There are no working bikes available" if empty?
    @bikes.select{ |bike| bike.working? }.pop
  end

  # def release_broken_bikes
  #   @broken_bikes
  # end

  private

  def full?
    @bikes.count == @capacity
  end

  def empty?
    @bikes.select{|bike| bike.working? }.count == 0
  end

end
