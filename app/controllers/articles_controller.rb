class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # Display the parameters that are send by new
    # render plain: params[:article].inspect

    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def delete
    @article = Article.find(params[:id])

    if @article.delete(params[:id])
      flash[:notice] = "Article was successfully deleted!"
      redirect_to index_path
    else
      render 'index'
    end
  end

  private
  def article_params
    params.required(:article).permit(:title, :description)
  end
end