class Public::HomesController < ApplicationController

  def top
    @review = Review.published.page(params[:page]).per(4)
  end

  def about
  end
end
