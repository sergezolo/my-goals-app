class GoalsController < ApplicationController

    get '/goals' do					
        if logged_in?				
            @goals = current_user.goals		
            erb :'goals/goals'			
        else				
            redirect '/login'			
        end				
    end

    get '/goals/new' do					
        if logged_in?				
            erb :'/goals/new'			
        else				
            redirect '/login'			
        end				
    end					
                        
    post '/goals' do					
        if logged_in?				
            post = current_user.posts.build(param)			
                        
            if post.save			
                redirect '/goals'		
            else			
                redirect '/goals/new'		
            end			
        else				
            redirect '/login'			
        end				
    end 					
    
    
    

end
