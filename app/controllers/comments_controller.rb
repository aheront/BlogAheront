class CommentsController < ApplicationController

  # GET /comments
  # GET /comments.json
  def index
  end

  def new
    @comment = Comment.new
    @comment.post = Post.find(params[:post_id])
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new comment_params
    if @comment.save
      @new_comment = Comment.new
      respond_to do |format|
        format.html do
          flash[:success] = 'Your comment has been posted.'
          redirect_to @comment.source
        end
        format.js
      end
    else
      @new_comment = @comment
      respond_to do |format|
        format.html { render @comment.source }
        format.js { render action: 'failed_save' }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:author, :content, :source_type,:source_id)
    end

end
