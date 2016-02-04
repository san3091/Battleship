require './position.rb'
require 'pp'

class Grid 

	#inspired by Marjin Haverbeke's Eloquent Javascript Electronic Life project


	def initialize(width, height)
		@space = Array.new(width * height) { Position.new }
		# @space = []
		@width = width
		@height = height
	end

	# The grid should take care of seeing whether or not the positions given is inside the grid.
	def is_inside x, y 
		x > 0 && x < @width && y > 0 && y < @height
	end

	# The grid doesn't care about the state of the Position, that's for the position. The grid returns the position object. 
	def get_space x, y
		@space[x + (y * @width)]
	end

	def to_s
		# logic to represent itself as a string
		space = @space
		sliced = []
		output = ""

		@height.times do
			sliced << space.slice!(0..(@width - 1))
		end
		
		sliced.map! do |row| 
			row.map! do |position| 
				output << (position.occupied ? "# " : "& ")
			end 
			output << "\n"
		end
		output
	end

	def place_ship name, length, origin, direction
		# if they're legal spaces, shovel the position objects into the array, pass it to the ship so it can know the position states.
	end

	def shoot x, y
		# space = get_space(x, y)
		# return false if space.hit? 
		# space.hit = true
		# return space.occupant if space.occupant
		# return true
	end
end

grid = Grid.new(3, 3)
# grid.make_space
grid.to_s






