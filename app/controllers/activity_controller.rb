class ActivityController < ApplicationController
  def new
  end
  
  def create
    @act = Activity.new
    @act.title = params[:act_title]
    @act.content = params[:act_content]
    @act.image = params[:image]
    
    @act.user_id = current_user.id
    
    @act.save
    
    redirect_to "/note/activity"
    
  end

  def show
    @act = Activity.find params[:post_id]
  end

  def edit
    @act = Activity.find params[:post_id]
  end
  
  def update
    @act = Activity.find params[:post_id]
    @act.title = params[:act_title]
    @act.content = params[:act_content]
    @act.image = params[:image]
    
    @act.save
    
    redirect_to "/note/activity"
  end
 
  def destroy
    @act = Activity.find params[:post_id]
    @act.destroy
    
    redirect_to "/note/activity"
  end
end
