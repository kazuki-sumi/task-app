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
    @article_file = ArticleFile.new(upload_file_params)
    if @article_file.save
      redirect_to admin_article_files_path, notice: "ファイルを作成しました。"
    else
      render :new
    end
  end

  def destroy
    @article_file = ArticleFile.find(params[:id])
    @article_file.destroy!
    redirect_to admin_article_files_path, alert: "ファイルを削除しました。"
  end

  private

  def upload_file_params
    file = params[:article_file][:file]
    {
      name: file.original_filename,
      content_type: file.content_type,
      file: file
    }
  end
end
