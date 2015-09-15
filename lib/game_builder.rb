class GameBuilder

	def self.build_game(level,store)
		game = Game.new
		game.level = level
		game.game_colours = GameColours::get_game_colours(level)
		game.number_of_guesses = Constants::NUMBER_OF_GUESSES
		game.store = store
		game
	end
end