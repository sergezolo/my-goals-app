class GoalsController < ApplicationController

    get "/goals" do					
        if logged_in?				
            @goals = current_user.goals
            params.each do |k, v|
                if k != "id"
                    @task = Task.all.find_by_id(k.to_i)
                    @task.update(status: "1")
                    #if @task.status == "1"
                        #@task.update(status: nil)
                    #else
                        #@task.update(status: "1")
                    #end
                end
            end
            erb :"goals/index"			
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
        if logged_in? && params[:title] != ""
            @goal = current_user.goals.build(title: params[:title], notes: params[:notes])
            params[:tasks].each do |task|
                @goal.tasks.build(task: task["task"])
            end

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
            if @goal && params[:title] != ""
                @goal.title = params[:title]
                    @goal.tasks.each_with_index do |task, index|
                        task.update(task: params[:tasks][index]["task"])
                    end
                @goal.notes = params[:notes]
                @goal.save
                redirect to "/goals/#{@goal.id}"	
            else		
                redirect to "/goals/#{@goal.id}/edit"	
            end			
        else				
            redirect to "/login"			
        end				
    end 					
                        
    delete "/goals/:id" do					
        if logged_in?	
            goal = current_user.goals.find_by_id(params[:id])	
            if goal	
                goal.tasks.each {|task| task.delete}
                goal.delete	
            end			
            redirect to "/goals"			
        else				
            redirect to "/login"			
        end				
    end 					
 
end
