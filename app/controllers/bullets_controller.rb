class BulletsController < ApplicationController

  def create

  end

  def show
    @bullet = Bullet.find(params[:id])
    render json: @bullet.hashify.to_json
  end

  def permitted_params
  end
end
