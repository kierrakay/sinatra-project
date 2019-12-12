require 'byebug'
class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"
    end
    
get '/' do 
"<h1>Hello, World</h1>"
 end 

 get '/failure' do 
    erb :failure 
 end 

 get '/signup' do 

    erb :signup
end

post '/signup' do 
    user = User.new(user_params)
    if user.save
        redirect '/'
    else 
        @errors = ["signup failed"] 
        erb :failure
    end
end 

get '/login' do 
    erb :login 
end

post '/login' do 
    #Finder user with this username 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect '/'
    else 
        @errors = ["invalid username or password"] 
    erb :failure
end
end 

private 

def user_params
    { username: params[:username], password: params[:password] }
end
end

