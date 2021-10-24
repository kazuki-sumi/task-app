class Admin::ArticlesController < Admin::ApplicationController
  def index
    @articles = Article.all.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(form_params)
    if @article.save
      redirect_to :admin_articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(form_params)
      redirect_to :admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!
    redirect_to :admin_articles_path
  end

  private

  def form_params
    params.require(:form).permit(:title, :content, :published_at, :important, :status)
  end
end
