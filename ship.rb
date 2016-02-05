# require './position.rb'
require 'pp'

class Ship
  attr_accessor :name, :spaces

  def initialize name, spaces #didn't need splat because array is bring formed in Grid
    @spaces = spaces
    @name = name

    spaces.each {|s| s.occupant = self }
    make
  end

  # check if the positions hash is empty, return boolean
  def sunk?
    @spaces.each { |position| return true unless position.occupied }
  end

  # take the positions in the spaces array and flip then to occupied
  def make
    @spaces.each { |position| position.occupied = true }
    # pp "made ship: #{@spaces}"
  end

  def length
    @spaces.length
  end
end
