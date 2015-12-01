require "gosu"

class Button

	def initialize(x, y, w, h, image, crossed)
		@x = x
		@y = y
		@w = w
		@h = h
		@image = Gosu::Image.new(image)
		@crossed = crossed
		@scalex = @w / 100
		@scaley = @h / 100
	end

	def collision?(x, y)
		x > @x && x < @x + @w && y > @y && y < @y + @h
	end

	def draw
		@image.draw(@x, @y, 2, @scalex, @scaley)
	end

end