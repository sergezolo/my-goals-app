
[1mFrom:[0m /home/sergezolo/Development/code/my-goals-app/app/controllers/goals_controller.rb:36 self.GET /goals/:id:

    [1;34m31[0m:         [32mend[0m				
    [1;34m32[0m:     [32mend[0m 					
    [1;34m33[0m:                    
    [1;34m34[0m:     get [31m[1;31m"[0m[31m/goals/:id[1;31m"[0m[31m[0m [32mdo[0m					
    [1;34m35[0m:         [32mif[0m logged_in?	
 => [1;34m36[0m:             			binding.pry
    [1;34m37[0m:             @goal = current_user.goals.find_by_id(params[[33m:id[0m])
    [1;34m38[0m:             [32mif[0m @goal			
    [1;34m39[0m:                 erb [33m:[1;33m"[0m[33m/goals/show[1;33m"[0m[33m[0m		
    [1;34m40[0m:             [32melse[0m			
    [1;34m41[0m:                 redirect to [31m[1;31m"[0m[31m/goals[1;31m"[0m[31m[0m		

