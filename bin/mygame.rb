require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

#each of these blocks defines a ROUTE (e.g. get '/') and how the app responds to that specific HTTP request (e.g. "Hello world")
get '/' do
  return 'Hello world'
end

get '/hello/' do
  greeting = params[:greeting] || "Hi There"
  erb :index, :locals => {'greeting' => greeting}
end
