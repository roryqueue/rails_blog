class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save

      redirect_to articles_path
    else flash.now[:notice] = "uh oh! could not be saved"
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :body, category_ids: [])
  end
end
