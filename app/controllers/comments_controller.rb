class CommentsController < ApplicationController
  def create
    @article = Article.find(comment_params)

    @comment.article = @article

    if @comment.save
      redirect_to article_path
    else
      flash.now[:notice] = "uh oh"
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
