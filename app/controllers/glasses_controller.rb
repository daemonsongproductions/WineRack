class GlassesController < ApplicationController

  def index

    @glasses = glasses_service.glasses_for_user(user_id: current_user.id, page: params[:page] || 1)

  end

  def show

  end

  def new

  end

  def create

    response = glasses_service.add_a_glass_for_freedom(
      wine_name: params[:wine_name],
      vintage: params[:vintage],
      winemaker_name: params[:winemaker_name],
      date: params[:date],
      rating: params[:rating],
      notes: params[:notes],
      user_id: current_user.id
    )

    if response.error.nil?
      redirect_to glasses_path
    else
      flash.now[:alert] = "That didn't work! Did you fill everything out correctly?"
      render 'new'
    end

  end

  private

  def glasses_service
    GlassesService.new
  end

end