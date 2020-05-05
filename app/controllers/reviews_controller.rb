class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @bleager = Bleager.find(params[:bleager_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to controller: :bleagers, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:review).merge(bleager_id: params[:bleager_id])
  end
end