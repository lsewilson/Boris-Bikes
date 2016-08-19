class Garage

  attr_reader :bikes

  def receive(van)
    @bikes = van.bikes
  end

end
