class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
            redirect "/goals"
        else
            erb :'/users/login'
        end        
    end
    
    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            redirect '/goals'
        else
            redirect '/login'
        end
    end
  
    get '/logout' do
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

end



