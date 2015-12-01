require "gosu"

class Tile

	def initialize(x, y, type)
		@x = x
		@y = y
		@type = type
		@images = []
		@images.push(Gosu::Image.new("block0.png"))
		@images.push(Gosu::Image.new("block1.png"))
		@images.push(Gosu::Image.new("block2.png"))
		@images.push(Gosu::Image.new("block3.png"))
		@image = nil
		case type
			when "0"
				@image = @images[0]
			when "1"
				@image = @images[1]
			when "2"
				@image = @images[2]
			when "3"
				@image = @images[3]
		end

	end

	def draw
		@image.draw(@x, @y, 1)
	end

end