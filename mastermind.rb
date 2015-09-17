
require 'colorize'
require 'json'

require_relative "lib/game_colours"
require_relative "lib/lang/en/messages"
require_relative "lib/constants"
require_relative "lib/mastermind_generator"
require_relative "lib/game_builder"
require_relative "lib/game"
require_relative "lib/masterminder"
require_relative "lib/player"
require_relative "lib/game_engine"
require_relative "lib/game_store"


GameEngine.run()
