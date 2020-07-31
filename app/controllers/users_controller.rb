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
        #binding.pry
        if user || params.values.any? {|v| v=="" }
            redirect '/message'
        else 
            user = User.create(params)
            session[:id] = user.id
            redirect '/goals'
        end
    end

    # post '/signup' do
    #     user = User.find_by(email: params[:email])
    #     binding.pry
    #     if user == nil 
    #         user = User.create(params)
    #         session[:id] = user.id
    #         redirect '/goals'
    #     else 
    #         redirect '/message'
    #     end
    # end
 
end



