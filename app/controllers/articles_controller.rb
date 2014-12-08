class ArticlesController < ApplicationController
  before_filter :check_if_admin, only: [:new, :create, :edit]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save ? redirect_to(@article) : render(:new)
  end

  def edit
  end

  def update
    @article.update(article_params) ? redirect_to(@article) : redirect_to(@article)
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def check_if_admin
    if current_user
      redirect_to root_path, notice: "Only admins allowed!" if !current_user.is_admin?
    else
      redirect_to root_path, notice: "Please sign in!"
    end
  end
end
