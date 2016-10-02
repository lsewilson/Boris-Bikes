#accepts bikes from van
#fixes bikes
class Garage

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def release_fixed_bikes(van)
    @bikes.each do |bike|
      van.dock(bike.fix)
    end
    @bikes.reject!{|bike| bike.working?}
  end

end
