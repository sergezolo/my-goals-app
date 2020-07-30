class TasksController < ApplicationController

    patch '/tasks/:id' do
        task = Task.find_by_id(params[:id])
        task.update(status: params[:status])
        redirect "goals/#{task.goal.id}"
    end

 
 
end



