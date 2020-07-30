class TasksController < ApplicationController

    get "/tasks/new" do	
        if logged_in?
            erb :"/tasks/new"
        else				
            redirect to "/login"			
        end				
    end					

    post "/tasks" do
        if logged_in?
            @task = Task.new(task: params["tasks"].first["task"], goal_id: session[:goal_id])
            if @task.task != ""
                @task.save 			
                redirect to "goals/#{@task.goal.id}"		
            else			
                redirect to "/tasks/new"		
            end	
        else				
            redirect to "/login"			
        end				
    end 

    patch '/tasks/:id' do
        task = Task.find_by_id(params[:id])
        task.update(status: params[:status])
        redirect "goals/#{task.goal.id}"
    end

end



