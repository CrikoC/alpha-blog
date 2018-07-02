class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end

  def edit
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
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted!"
    redirect_to articles_path
  end

  private
  def set_article
    @article = article.find(params[:id])
  end

  def article_params
    params.required(:article).permit(:title, :description)
  end
end