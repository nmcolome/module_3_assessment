class Api::V1::ItemsController < ApiBaseController
  def index
    render json: Item.all, each_serializer: ItemsSerializer
  end

  def show
    render json: Item.find(params[:id]), serializer: ItemsSerializer
  end
end