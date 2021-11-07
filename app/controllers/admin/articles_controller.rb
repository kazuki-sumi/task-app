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
      redirect_to admin_articles_path, notice: "記事を作成しました。"
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
      redirect_to admin_articles_path, notice: "記事を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy!
    redirect_to :admin_articles_path, notice: "記事を削除しました。"
  end

  private

  def form_params
    params.require(:article).permit(:title, :content, :published_at, :important, :status)
  end
end
