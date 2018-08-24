class CalController < ApplicationController
    
    def food
    @post = Post.find params[:post_id]
    
    end
    
    def food_result
        
    @post = Post.find params[:post_id]    
        
    @male = params[:mt_male_num]
    @female = params[:mt_female_num]
    
    puts @male.to_i
    puts @female.to_i
        
    @result_rice = "1"
    
    @result_noodle = "2"
    
    @result_meat = @male * 0.666 + @female * 0.5 
    
    puts @result_meat.to_f.round
    
    @result_price = @result_rice * 1500 + @result_noodle * 900 + @result_meat * 19000
    
    end
    
    def drink
    @post = Post.find params[:post_id] 
    @post_all = @post.num_male + @post.num_female 
    end
    
end
