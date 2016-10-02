class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

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

  def release_broken_bikes(van)
    @bikes.each do |bike|
      van.dock(bike) if !bike.working?
    end
    @bikes.reject!{|bike| !bike.working?}
  end

  private

  def full?
    @bikes.count == @capacity
  end

  def empty?
    @bikes.select{|bike| bike.working? }.count == 0
  end

end
