class Goal < ActiveRecord::Base
    belongs_to :user
    has_many :tasks


    def percentage_calculation
        a = 0; b = 0;
        
        self.tasks.each do |task|
            if task.task != ""
                a += 1
            end

            if task.status == true && a != 0
                b += 1
            end

        end

        if a == 0 && b == 0 
            @percent = 100
        else
            @percent = (100 * b) / a
        end
        @percent
    end

end