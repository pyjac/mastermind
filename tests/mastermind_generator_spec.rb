
require '../lib/game_colours.rb'
require '../lib/constants.rb'
require '../lib/mastermind_generator.rb'
describe "MastermindGenerator" do

  it "can generate beginner mastermind sequence" do
  	generated = MastermindGenerator.generate(Keys::BEGINNER)

    expect(generated.length).to eql(Constants::NUMBER_OF_BEGINNER_CHARACTERS)

    generated.each do |color|
    	expect(GameColours.beginner_colours.include?(color)).to eql(true)
	end

  end

  it "can generate INTERMEDIATE mastermind sequence" do
  	generated = MastermindGenerator.generate(Keys::INTERMEDIATE)

    expect(generated.length).to eql(Constants::NUMBER_OF_INTERMEDIATE_CHARACTERS)

    generated.each do |color|
    	expect(GameColours.intermediate_colour.include?(color)).to eql(true)
	end

  end

  it "can generate ADVANCED mastermind sequence" do
  	generated = MastermindGenerator.generate(Keys::ADVANCED)

    expect(generated.length).to eql(Constants::NUMBER_OF_ADVANCED_CHARACTERS)

    generated.each do |color|
    	expect(GameColours.advanced_colours.include?(color)).to eql(true)
	end

  end

end