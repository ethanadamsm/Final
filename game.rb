require "gosu"
require_relative "grid"
require_relative "button"

class Game < Gosu::Window

	WIDTH = 736
	HEIGHT = 384

	def initialize 
		super(WIDTH, HEIGHT)
		@grid = Grid.new(0)
		@menu = true
		@level = false
		@bg = Gosu::Image.new("background.png")
		@button_play = Button.new(168, 200, 400, 100, "button.png", "Play", 30, false)
	end

	def update

	end

	def draw
		if @level
			@grid.draw
		end

		if @menu
			@bg.draw(0, 0, 0)
			@button_play.draw
		end
	end

end

game = Game.new
game.show