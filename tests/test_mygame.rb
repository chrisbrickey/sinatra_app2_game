require "./bin/mygame.rb"
require "test/unit"
require "rack/test"

class MyGameTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    #need to change below to test that we are redirected to /game
    # assert_equal 'Hello world', last_response.body
  end

  def test_get_game
    get '/game'
    assert last_response.ok?
    #need to change below to test that 'if room', we go to show_room.erb
    # assert last_response.body.include?('A Greeting')
  end

  def test_post_game
    post '/game' #not sure what params should be - action?....,params={:name => 'Frank', :greeting => "Hi"}
    assert last_response.ok?
    #need to change below to test that ....(see mygame.erb, post '/game' do...)
    # assert last_response.body.include?('I just wanted to say')
  end



end #of class
