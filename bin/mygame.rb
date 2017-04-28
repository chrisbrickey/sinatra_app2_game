require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

#each of these blocks (aka 'handlers') defines a ROUTE (e.g. get '/') and how the app responds to that specific HTTP request (e.g. "Hello world")
#'/' is called the 'index mapping'; when someone goes to this URL, Sinatra will find the class index and load it to handle the request
get '/' do
  return 'Hello world'
end

#returns the :hello_form page
get '/hello/' do
  erb :hello_form
end

#this 'handler' specifies what happens when the browser RECEIVES the :hello_form (hello_form.erb)
post '/hello/' do

  #this gets the <%= greeting %> (used in index.erb) from the params Hashmap...when you type "http://localhost:8080/hello/greeting=Hi" into the browser, this assigns greeting = "Hi"
  # || means that if there's no params given (e.g. if I just type http://localhost:8080/hello into the browser)....it will show "Hi There" (the default)
  greeting = params[:greeting] || "Hi There"

  name = params[:name] || "Nobody"

  #calling the 'erb' method with params index and locals...ruby doesn't make you use parens here...calling method on index.erb file
  #This 'renders' the :index view
  #The:locals={....}part says, ”give views/index.erb (aka the 'greet view') the local variables greeting and name"
  erb :index, :locals => {'greeting' => greeting, 'name' => name}
end



#this 'handler' specifies what happens when the browser goes to ''/hello'
# get '/hello/' do

  #this gets the <%= greeting %> (used in index.erb) from the params Hashmap...when you type "http://localhost:8080/hello/greeting=Hi" into the browser, this assigns greeting = "Hi"
  # || means that if there's no params given (e.g. if I just type http://localhost:8080/hello into the browser)....it will show "Hi There" (the default)
  # greeting = params[:greeting] || "Hi There"

  #calling the 'erb' method with params index and locals...ruby doesn't make you use parens here
  #This 'renders' the :index view
  #The:locals={’greeting’=>greeting}part says, ”Also give this greet view ('the greet view' is the file views/index.erb) the local variables greeting with this setting."
  # erb :index, :locals => {'greeting' => greeting}
# end
