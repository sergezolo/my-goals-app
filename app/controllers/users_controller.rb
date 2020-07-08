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
 
end



