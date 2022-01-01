class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def create
    filtered_params = params.permit(permitted_params)
    col = Collection.new({type: params[:type], start_date: Date.parse(params[:start_date])})
    if col.save 
      render json: col, status: 200
    else
      render json: {errors: "Bad request"}.to_json, status: 400
    end
  end

  def show
    @collection = Collection.find(params[:id])
    render json: @collection.hashify
  end

  def permitted_params
    [:start_date, :collection_type]
  end
end