require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "FBI knows everything"
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?		
      !!session[:id]	
    end		
 
    def current_user		
      @user ||= User.find_by_id(session[:id]) if logged_in?	
    end	

    def logout!
      session.clear
    end
  end

end
