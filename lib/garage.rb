class Garage

  attr_reader :bikes

  def receive(van)
    @bikes = van.van_bikes
  end

end
