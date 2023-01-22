class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @review = Review.all
  end
end
