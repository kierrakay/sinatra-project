class EntriesController < ApplicationController 

    get '/entries' do
        redirect_if_not_logged_in 
        @entries = current_user.entries
        erb :show
    end

 get '/entries/new' do 
    erb :new
end 

post '/entries' do
    redirect_if_not_logged_in 
    entry = Entry.new(entry_params)
    if entry.save 
        redirect '/entries'
    else
    @errors = [params.to_s]
    erb :failure
    end
end

get '/entries/:id/edit' do 
    redirect_if_not_logged_in 
  set_entry
    erb :edit 
end

patch '/entries/:id' do 
    redirect_if_not_logged_in 
    set_entry
    if @entry.update(entry_params)
redirect '/entries'
else 
@errors = ["could not update"]
erb :failure 
end
end

delete '/entries/:id' do
    set_entry 
    @entry.destroy
    redirect '/entries'
   end

    private 

    def entry_params 
        { author: params[:author], mood: params[:mood], title: params[:title], body: params[:body], time: params[:date], user: current_user}
end

 def set_entry 
    @entry = Entry.find_by(id: params[:id])
    unless @entry
        @errors = ["invalid entry id"] 
       redirect "/"
end
end

end 


