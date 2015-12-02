require_relative "tile"

class Grid

	def initialize(level)
		file = File.open("#{level}.txt")
		file = file.read
		tiles = file.split(" ")
		@tile_objects = []
		@player_spot = nil
		#@player_image = Gosu::Image("player.png")
		x = 0;
		y = 0;
		(0...tiles.length).each do |n|
			if tiles[n] == "1"
				@player_spot = n
			end
			@tile_objects.push(Tile.new(x, y, tiles[n]))
			x += 32
			if x >= 736
				x = 0
				y += 32
			end
		end
	end

	def draw
		@tile_objects.each do |tile|
			tile.draw
		end
	end

end