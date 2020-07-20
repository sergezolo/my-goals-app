class Goal < ActiveRecord::Base
    belongs_to :user
    has_many :tasks
end

def percentage_calculation
    a = 0; b = 0;
        @goal.tasks.each do |task|
            if task.task != ""
                a += 1
            end
        end
        
        @goal.tasks.each do |task|
            if task.status == 1
                b += 1
            end
        end

    @percent = (100 * b) / a

end