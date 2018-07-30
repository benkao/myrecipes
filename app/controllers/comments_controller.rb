class CommentsController < ApplicationController
  before_action :require_user

  def create
    @recipe = Recipe.find(params[:recipe_id]) #if put params[:id] <- it will get comment_id
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_chef #that's why before_action :require_uer is needed
    if @comment.save
     flash[:success] = "Comment was create successfully."
     redirect_to recipe_path(@recipe)
    else
     flash[:danger] = "Comment was not created."
     redirect_to :back 
     #cannot use render 'recipes/show' 
     #because when comment is blank and there is no @comment in recipe/show to render(meaning not a separate request)
     #@comments is empty and cannot build prior comments
    end
  end  

private
  def comment_params
    params.require(:comment).permit(:description)
  end

end