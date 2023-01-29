class Admin::SoupsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @soups = Soup.all
    @soup = Soup.new
  end

  def create
    @soup = Soup.new(soup_params)
    if @soup.save
      flash[:notice] = "新規登録しました"
      redirect_to admin_soups_path
    else
      @soups = Soup.all
      render :index
    end
  end

  def edit
    @soup = Soup.find(params[:id])
  end

  def update
    @soup = Soup.find(params[:id])
     if @soup.update(soup_params)
      flash[:notice] = "内容を変更しました"
      redirect_to admin_soups_path
     else
      render :edit
     end
  end

 private
  def soup_params
    params.require(:soup).permit(:name)
  end
end
