require './position.rb'
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
	# position is the object stored inside a space, shich is the array index. 
	# The grid should take care of seeing whether or not the positions given is inside the grid.
	def inside? x, y 
		x > 0 && x < @width && y > 0 && y < @height
	end

	# The grid doesn't care about the state of the Position, that's for the position. The grid returns the position object. 
	def get_space x, y
		@spaces[x + (y * @width)]
	end

	def to_s
		spaces = @spaces
		output = ""

		@height.times do
			@width.times do
				output << (spaces.shift.occupied ? "# " : "& ") #for dev "& ", for prod "  "
			end
			output << "\n"
		end
		puts output
	end

	# def place_ship name, length, origin , direction # origins is an array with two items, the x coord at 0 and the y at 1
	# 	# if they're legal spaces, shovel the position objects into an array, pass it to the ship so it can know the position states.
	# 	ship_data = { name: name }
	# 	spaces = []
	# 	spaces << origin
	# 	case direction # this is kind of confusing but for now the 0, 0 coord is at the nw corner of the grid. 
	# 	when :n
	# 		length.times { spaces << [(origin[0] -= 1), origin[1]] } # I NEED TO DRY THIS UP
	# 	when :e
	# 		length.times { spaces << [origin[0], (origin[1] += 1)] }
	# 	when :s
	# 		length.times { spaces << [(origin[0] += 1), origin[1]]; p "coord: #{origin[0]}" }
	# 	when :w
	# 		length.times { spaces << [origin[0], (origin[1] -= 1)] }
	# 	end
	# 	spaces
	# end

	def place_ship length, origin, direction
		spaces = []
		transform = @directions[direction]
		length.times { spaces << [(origin[0] += transform[0]), (origin[1] += transform[1])] }
		pp spaces
	end

	def shoot x, y
		# space = get_space(x, y)
		# return false if space.hit? 
		# space.hit = true
		# return space.occupant if space.occupant
		# return true
	end
end

grid = Grid.new(7, 5)
# grid.make_space
# grid.to_s # it works!
pp grid.place_ship 3, [1, 2], :s






