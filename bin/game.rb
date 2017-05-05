require 'sinatra'
require '../lib/game/map.rb'

set :port, 8080
set :static, true
set :public_folder, "static"  #this allow us to access this form via http://localhost:8080/hola.html
set :views, "views"

#sessions uses cookies in browser to track the state of the user through the app (must use cookies becaue HTTP is stateless)
#in this game, session tracks the current room
enable :sessions
set :session_secret, 'BADSECRET'


#the first line of these blocks are called 'handlers'
get '/' do #when browser asks for root URL (the index)
  session[:room] = 'START'
  redirect to('/game')
end


get '/game' do #when browser asks for root/game
  room = Map::load_room(session)

  if room
    erb :show_room, :locals => { :room => room } # call 'erb' method (show an .erb file, usually in views) with two parameters: 1) erb file name??: show_room)  2) current room (:locals) is defined here pulling items from the params hash)
  else
    erb :you_died
  end

end

post 'game' do #when browser receives a form from root/game
  room = Map::load_room(session)
  action = params[:action]  #take 'action' from URL typed into browser

  if room
    next_room = room.go(action) || room.go("*") #sets next_room according to the go method on map.rb; if no action param available, it uses "*" as the param

    if next_room
      Map::save_room(session, next_room)
    end

    redirect to ('/game')

  else
    erb :you_died
  end

end
