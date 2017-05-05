require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"  #this allow us to access this form via http://localhost:8080/hola.html
set :views, "views"

#the first line of these blocks are called 'handlers'
get '/' do #when browser asks for root URL (the index)
  return 'Hello world'
end


get '/hello/' do #when browser asks for root/hello/
  erb :game_form # call 'erb' method (show an .erb file) with one parameter (the file name: hello_form); these files are in the views folder
end

post '/hello/' do #when browser receives a form from root/hello/
  greeting = params[:greeting] || "Hi there" #take 'greeting' from URL typed into browser; if none...greeting = "Hi there"
  name = params[:name] || "Nobody"
  erb :index, :locals => { 'greeting' => greeting, 'name' => name } # call 'erb' method (show an .erb file). Parameter1 tells you which .erb file to show (views/index.erb). Parameter2 (:locals) is defined here pulling items from the params hash)
end
