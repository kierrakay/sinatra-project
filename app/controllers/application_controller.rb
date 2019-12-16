require 'byebug'
class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        set :public_folder, 'styles'
        enable :sessions
        set :session_secret, "password_security"
    end
    
get '/' do 
erb :index
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
        session[:user_id] = user.id
        redirect '/entries'
    else 
        @errors = user.errors.full_messages
        erb :failure
    end
end 

get '/login' do 
    erb :login 
end

get '/logout' do 
    session.clear 
    redirect '/'
end 

helpers do 
    def logged_in? 
        !!session[:user_id]
    end

    def redirect_if_not_logged_in 
        unless logged_in? 
            redirect '/login'
        end 
    end

    def current_user 
        User.find(session[:user_id])
    end
end


post '/login' do 
    #Finder user with this username 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect '/entries'
    else 
        @errors = ["Please enter a valid username and password to log into your account"] 
    erb :failure
end
end 

get '/entries' do

    @user = User.find(session[:user_id])
    erb :home
end
private 

def user_params
    { username: params[:username], password: params[:password] }
end
end

