class Messages 


	GAME_EXIT_MESSAGE = "Bye Bye"
	GAME_INSTRUCTIONS = "Enter a sequence of 4 colors containing the generated colors e.g RYBG or YGRB.\n" +
     "If you enter fewer than 4 or more than 4 colors, you would receive an error message"

	WELCOME_MESSAGE = "Welcome to MASTERMIND\n" +
    "Would you like to #{"(p)lay".colorize(:green)}, read the #{"(i)nstructions".colorize(:blue)}, or #{"(q)uit".colorize(:red)}?\n"

    PLAY_GAME_MESSAGE = "To start the game select a level you would like to play:\n"+
     "Enter (b) for Beginner\n"+
     "Enter (i) for Intermediate\n" +
     "Enter (a) for Advanced"

    GAME_LEVEL_MESSAGE = "I have generated a %s sequence with four elements made up of:\n " +
        "%s \n"+
        "Use #{"(q)uit".colorize(:red)} at any time to end the game.\n" +
        "What's your guess?"

    GAME_EXACT_PARTIAL_COUNT_MESSAGE = "You had %s positions exactly matched " +
    	"and %s near match\n" +
        "You have tried %s times. You have %s attempts left.\n"+
        "Try again: "

    GAME_CONGRAT_MESSAGE = "Congratulations! You've guessed the sequence!"

    GAME_CONGRATULATORY_MESSAGE = "%s, you guessed the sequence '%s' in %s guesses over %s.\n" +
    	"That's 1 minute, 10 seconds faster and two guesses fewer than the average."
    GAME_REPLAY_MESSAGE = "Do you want to #{"(p)lay".colorize(:green)} again or #{"(q)uit".colorize(:red)}?"
    #GAME_CONGRATULATORY_MESSAGE = "Congratulobia You Won !!!"

  #   GAME_CONGRATULATORY_MESSAGE = "Congratulations! You guessed the sequence '%s' in %s guesses over %s.\n" +
		# "Do you want to (p)lay again or (q)uit?"

    GAME_SHORT_INPUT_MESSAGE = "Input value too short. Input exactly %s characters"
    GAME_LONG_INPUT_MESSAGE = "Input value too long. Input exactly %s characters"

    GAME_PLAYER_NAME_PROMPT = "Cooooool !!! \n" + 
    	"Start by telling me your name: "

end