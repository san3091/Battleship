class Ship
  attr_accessor :spaces, :name

  def initialize name, *spaces
    @spaces = spaces
    @name = name
    @spaces.each {|s| s.occupant = self }
  end

  # check if the positions hash is empty, return boolean
  def sunk?
    @positions.empty?
  end

  def make length
  end

  def length
    spaces.length
  end
end




