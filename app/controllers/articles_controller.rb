class ArticlesController < ApplicationController
  before_filter :check_if_admin, only: [:new, :create, :edit]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def check_if_admin
    if current_user
      raise 'Only admins allowed!' unless current_user.is_admin?
    else
      # or you can use the authenticate_user! devise provides to only allow signed_in users
      raise 'Please sign in!'
    end
  end
end
