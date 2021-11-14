class Admin::ArticleFilesController < Admin::ApplicationController
  def index
    @article_files = ArticleFile.all.page(params[:page])
  end

  def show
    @article_file = ArticleFile.find(params[:id])
  end

  def new
    @article_file = ArticleFile.new
  end

  def create
    @article_file = ArticleFile.new(create_params)
    if @article_file.save!
      redirect_to admin_article_files_path, flash: "ファイルを作成しました。"
    else
      render :new
    end
  end

  def edit
    @article_file = ArticleFile.find(params[:id])
  end

  def update
    @article_file = ArticleFile.find(params[:id])
    if @article_file.update!(update_params)
      redirect_to admin_article_files_path, flash: "ファイルを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @article_file = ArticleFile.find(params[:id])
    @article_file.destroy!
    redirect_to admin_article_files_path, flash: "ファイルを削除しました。"
  end

  private
end
