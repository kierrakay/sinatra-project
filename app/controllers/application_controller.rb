class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
    end
    
get '/' do 
"<h1>Hello, World</h2>"
 end 

 get '/failure' do 
    erb :failure 
 end 
end