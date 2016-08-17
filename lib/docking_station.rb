require_relative 'bike'

class DockingStation

attr_reader :bike

  def release_bike
    if @bike == nil
      fail "There are no bikes available"
    end
    @bike
  end

  def dock_bike(bike)
    if @bike != nil
      fail "This docking station is full"
    end
    @bike = bike
  end

end
