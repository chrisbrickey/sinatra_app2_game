#this is testing the handlers from bin/game.rb

# require "../bin/game.rb" #this format required for running this file directly from tests directory
require "./bin/game.rb" #this format required for running rake test from root directory
require "test/unit"
require 'rack/test'

class GameTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end


  def test_my_default
    get '/'
    #update this so it tests correctly for a redirect
    # expect(last_response.status).to eq(302) #this tests that a redirect happened, 302 is the code for that
  end


  def test_game
    get '/game'
    assert last_response.ok? #checks to see if the page was loaded correctly
    #change below to test for whatever I expect when they go to /game
    # assert last_response.body.include?('add something here')
  end


  def test_game_post_die
    post '/game', params={:action => 'shoot!'} #causing error because params variable assigned but not used
    assert last_response.ok?
    #update below test to capture redirect correctly
    # assert last_response.body.include?('You died.') #because should be directed to you_died room/view if they enter 'shoot!' as action from central Corridor
  end

  def test_game_post_survive
    post '/game', params={:action => 'tell a joke'} #causing error because params variable assigned but not used
    assert last_response.ok?
    #update below test to capture redirect correctly
    # assert last_response.body.include?("You're in the armory.") #because should be directed to LASER_WEAPON_ARMORY if they enter 'tell a joke' as action from central Corridor
  end

end #of class
