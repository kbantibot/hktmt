class FoodController < ApplicationController
  
  def new
  end
  
  def create
    @food = Food.new
    @food.title = params[:food_title]
    @food.content = params[:food_content]
    @food.image = params[:image]
    
    @food.user_id = current_user.id
    @food.user_name = current_user.name
    
    @food.save
    
    redirect_to "/note/food"
  end
  

  def show
    @food = Food.find(params[:post_id])
    @food.user_name= current_user.name
    @comments = @food.comments
  end

  def edit
    @food = Food.find params[:post_id]
  end
  
  def update
    @food = Food.find params[:post_id]
    @food.title = params[:food_title]
    @food.content = params[:food_content]
    @food.image = params[:image]
    
    @food.save
    
    redirect_to "/note/food"
  end
  
  def destroy
    @food = Food.find params[:post_id]
    @food.destroy
    
    redirect_to "/note/food"
  end
  
end
