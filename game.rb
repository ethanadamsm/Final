require "gosu"
require_relative "grid"
require_relative "button"

class Game < Gosu::Window

	WIDTH = 736
	HEIGHT = 384

	def initialize 
		super(WIDTH, HEIGHT)
		@menu = true
		@level = false
		@game = false
		@bg = Gosu::Image.new("background.png")
		@button_play = Button.new(168, 200, 400, 100, "button.png", "Play", 30, false)
		@level_buttons = []
		@level_select = ""
		@grid_level = nil
		x = 20
		y = 167
		(0...10).each do |n|
			if x == 0 
				@level_buttons.push(Button.new(x, y, 50, 50, "button.png", (n + 1).to_s, 30, true))
			else
				@level_buttons.push(Button.new(x, y, 50, 50, "button.png", (n + 1).to_s, 30, false))
			end
			x += 92
		end
	end

	def update

	end

	def draw
		if @level
			@bg.draw(0, 0, 0)
			@level_buttons.each do |button|
				button.draw
			end
		elsif @menu
			@bg.draw(0, 0, 0)
			@button_play.draw
		elsif @game
			@grid_level.draw
		end
	end

	def needs_cursor?
		true
	end

	def button_down(id)
		if @menu
			case id 
				when Gosu::MsLeft
					if button_collide(@button_play)
						@menu = false
						@level = true
					end
			end
		elsif @level 
			case id 
				when Gosu::MsLeft
					@level_buttons.each do |button|
						if button_collide(button)
							@level_select = button.getText
							@level = false
							@game = true
							@grid_level = Grid.new(button.getText.to_i - 1)
						end
					end
			end
		end
	end

	def button_collide(button)
		if button.collision?(self.mouse_x, self.mouse_y)
			true
		end
	end

end

game = Game.new
game.show