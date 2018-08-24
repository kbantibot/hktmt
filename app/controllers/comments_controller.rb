class CommentsController < ApplicationController

 def create
  @comment = Comment.new
  @comment.name = params[:user_name]
  @comment.content = params[:input_comment]
  @comment.food_id = params[:food_id]
 
  @comment.save

  redirect_to "/food/show/#{params[:food_id]}"
 end

 def destroy
  @comment = Comment.find(params[:comment_id])
  @comment.destroy

  redirect_to "/food/show/#{params[:food_id]}"
 end

end
