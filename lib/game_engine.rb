class GameEngine

  def self.run(store)
    @store = store
    user_input = ""
    clear_screen
    display_welcome_message
    while (user_input != "q")
      print Constants::GAME_INPUT_PROMPT
      user_input = gets.chomp
      case user_input
        when 'p','play'
          play_game
        when 'i','instructions'
          display_instructions
        when 'q','quit'
          puts Messages::GAME_EXIT_MESSAGE
          break
      end
      display_welcome_message
    end
  end

  private 
  attr_accessor :store
  def self.display_welcome_message
    puts Messages::WELCOME_MESSAGE
  end
  def self.play_game
    
    puts Messages::PLAY_GAME_MESSAGE
    print Constants::GAME_INPUT_PROMPT
    user_level = gets.chomp

    if(user_level == 'q')
      return
    end
    if !['b','i','a'].include?(user_level)
      user_level = 'b' #Default Level 
    end

    game = GameBuilder::build_game(user_level,@store)
    game.run()
  end

  def self.clear_screen
    system "clear" or system "cls"
  end

  def self.display_instructions
    puts Messages::GAME_INSTRUCTIONS
  end 

end