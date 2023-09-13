class CommentsController < ApplicationController
 def create
   @comment = Comment.create(comment_params)
   if @comment.save
     redirect_to prototype_path
   else
     @comment = Comment.new
     @comments = @prototype.comments.includes(:user)
     render prototype_path
   end
  end
  
 private
  def comment_params
    params.require(:comment).permit(:text, :content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
