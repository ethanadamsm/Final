require "gosu"
require_relative "grid"

class Game < Gosu::Window

	WIDTH = 736
	HEIGHT = 384

	def initialize 
		super(WIDTH, HEIGHT)
		@grid = Grid.new(0)
	end

	def update

	end

	def draw
		@grid.draw
	end

end

game = Game.new
game.show