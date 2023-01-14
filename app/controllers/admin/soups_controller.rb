class Admin::SoupsController < ApplicationController
   before_action :authenticate_admin!
   
  def index
    @soups = Soup.all
    @soup = Soup.new
  end

  def create
    @soup = Soup.new(so_params)
    @soup.save
     redirect_to admin_soups_path
  end

  def edit
    @soup = Soup.find(params[:id])

  end

  def update
    @soup = Soup.find(params[:id])
     if @soup.update(soup_params)
      redirect_to admin_soups_path
     else
      render :edit
     end
  end
 
  private

  def genre_params
    params.require(:soup).permit(:name)
  end
end
