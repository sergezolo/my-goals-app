class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect "/goals"
        else
            erb :'/users/signup'
        end        
    end
    
    post '/signup' do
        user = User.find_by(email: params[:email])
        if user
            redirect '/login'
        else 
            user = User.create(params)
            session[:id] = user.id
            redirect '/goals'
        end
    end
    
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



