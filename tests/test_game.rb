#this is testing the handlers from hello_app.rb

require "../bin/game.rb"
require "test/unit"
require 'rack/test'

class HelloAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end


  def test_my_default
    get '/'
    assert_equal 'Hello world', last_response.body
  end


  def test_hello_form
    get '/hello/'
    assert last_response.ok? #checks to see if the page was loaded correctly
    assert last_response.body.include?('A Greeting')
  end


  def test_hello_form_post
    post '/hello/', params={:name => 'Frank', :greeting => 'Hi'}
    assert last_response.ok?
    assert last_response.body.include?('I just wanted to say')
  end

end #of class
