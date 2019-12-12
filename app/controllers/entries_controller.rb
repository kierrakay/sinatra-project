class EntriesController < ApplicationController 
 get '/entries/new' do 
    erb :new
end 

post '/entries' do
    entry = Entry.new(entry_params)
    if entry.save 
        redirect '/'
    else
    @errors = [params.to_s]
    erb :failure
    end
end

    private 

    def entry_params 
        { author: params[:author], mood: params[:mood], body: params[:body] }
end
end 


