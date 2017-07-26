class Api::V1::ItemsController < ApiBaseController
  def index
    render json: Item.all, each_serializer: ItemsSerializer
  end

  def show
    render json: Item.find(params[:id]), serializer: ItemsSerializer
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  def create
    render json: Item.create!(item_params), serializer: ItemsSerializer
  end

  private
    def item_params
      params.permit(:name, :description, :image_url)
    end
end