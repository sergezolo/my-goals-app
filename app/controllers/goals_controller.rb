class GoalsController < ApplicationController

    get "/goals" do					
        if logged_in?				
            @goals = current_user.goals		
            erb :"goals/goals"			
        else				
            redirect to "/login"			
        end				
    end

    get "/goals/new" do					
        if logged_in?				
            erb :"/goals/new"			
        else				
            redirect to "/login"			
        end				
    end					
                        
    post "/goals" do					
        if logged_in? && params[:title] != nil				
            @goal = current_user.goals.build(params)			
            if @goal.save			
                redirect to "/goals/#{@goal.id}"		
            else			
                redirect to "/goals/new"		
            end			
        else				
            redirect to "/login"			
        end				
    end 					
                   
    get "/goals/:id" do					
        if logged_in?				
            @goal = current_user.goals.find_by_id(params[:id])			
            if @goal			
                erb :"/goals/show"		
            else			
                redirect to "/goals"		
            end			
        else				
            redirect to "/login"			
        end				
    end 					
                        
    get "/goals/:id/edit" do					
        if logged_in?				
            @goal = current_user.goals.find_by_id(params[:id])			
            if @goal		
                erb :"/goals/edit"		
            else			
                redirect to "/goals"		
            end			
        else				
            redirect to "/login"			
        end				
    end 					
                        
                        
    patch "/goals/:id" do					
        if logged_in?				
            @goal = current_user.goals.find_by_id(params[:id])			
            if @goal && params[:title] != nil			
                @goal.title = params[:title]
                @goal.tasks = params[:tasks]
                @goal.notes = params[:notes]
                @goal.save
                redirect to "/goals/#{goal.id}"	
            else		
                redirect to "/goals/#{goal.id}/edit"	
            end			
        else				
            redirect to "/login"			
        end				
    end 					
                        
    delete "/goals/:id" do					
        if logged_in?				
            goal = current_user.goals.find_by_id(params[:id])			
            if goal			
                goal.delete		
            end			
            redirect to "/goals"			
        else				
            redirect to "/login"			
        end				
    end 					
 
end
