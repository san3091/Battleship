require './position.rb'
require './ship.rb'
require 'pp'

class Grid 

	#inspired by Marjin Haverbeke's Eloquent Javascript Electronic Life project
	def initialize(width, height)
		@spaces = Array.new(width * height) { Position.new }
		# @space = []
		@width = width
		@height = height
		@directions = {
			n: [0, -1],
			e: [1, 0],
			s: [0, 1],
			w: [-1, 0]
		}
	end

	# is the position given inside the grid.
	def is_inside? x, y 
		x >= 0 && x < @width && y >= 0 && y < @height
	end

	# The grid doesn't care about the state of the Position, that's for the position. The grid returns the position object. 
	def get_position x, y
		@spaces[x + (y * @width)]
	end

	def to_s
		spaces = @spaces
		output = ""

		@height.times do
			@width.times do
				space = spaces.shift
				output << (space.occupied && !space.hit ? "# " : "~ ")
			end
			output << "\n"
		end
		puts output # puts for testing, remember to remove
	end

	def place_ship name, length, origin, direction
		coordinates = []
		spaces = []
		# get the transform array from direction symbol
		transform = @directions[direction]
		# applies the transform (there is an off by one error here because the first position shoveled is transformed before shoveling)
		length.times { coordinates << [(origin[0] += transform[0]), (origin[1] += transform[1])] }
		# check if it is out of bounds, if yes return false
		coordinates.each { |space| return false unless is_inside?(space[0], space[1]) }
		# create the array with the position objects to pass to the new ship
		coordinates.each { |space| spaces << get_position(space[0], space[1]) }
		# instantiate the ship with attributes
		Ship.new name, spaces
	end

	def shoot x, y
		space = get_position(x, y)
		p "coordinates given: #{x}, #{y}"
		p "space: #{space}"
		return false if space.hit
		p "space was not hit before"
		space.hit = true
		p "occupied by #{space.occupant || "nobody" }"
		return space.occupant if space.occupant
		p "space hit: #{space.hit}"
		return true
	end

end

grid = Grid.new(5, 5)
# grid.to_s # it works!
p grid.get_position 0, 0

# puts grid
grid.place_ship "Ship", 3, [1, 2], :s
grid.shoot 0, 0
grid.shoot 0, 0
grid.shoot 1, 0
grid.shoot 1, 0
grid.shoot 2, 0
puts grid







