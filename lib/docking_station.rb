require_relative "bike"

class DockingStation
  attr_reader :bike

  # def initialize
  #   @bike = []
  # end

  def release_bike
    @bike
    # fail
  end

  def dock(bike)
    @bike = bike
  end

end
