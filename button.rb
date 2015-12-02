require "gosu"

class Button

	def initialize(x, y, w, h, image, text, textsize, crossed)
		@x = x
		@y = y
		@w = w
		@h = h
		@image = Gosu::Image.new(image)
		@crossed = crossed
		@scalex = @w / 100
		@scaley = @h / 100
		@text = text
		@textsize = textsize
	end

	def collision?(x, y)
		x > @x && x < @x + @w && y > @y && y < @y + @h
	end

	def draw
		font = Gosu::Font.new(@textsize)
		@image.draw(@x, @y, 2, @scalex, @scaley)
		font.draw(@text, @x + (@w / 2) - @textsize, @y + (@h / 2) - (@textsize / 2), 2, 1, 1, 0xff_000000)
	end

end