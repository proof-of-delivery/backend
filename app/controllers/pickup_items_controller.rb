class PickupItemsController < ApplicationController
  before_action :set_pickup_item, only: %i[ show update destroy ]

  # GET /pickup_items
  def index
    @pickup_items = PickupItem.all
    @q = PickupItem.ransack(params[:q])
    @pickup_item = @q.result(:distinct => true).includes(:warehouse_order, :item, :pickup_order)

    render json: @pickup_items
  end

  # GET /pickup_items/1
  def show
    render json: @pickup_item
  end

  # POST /pickup_items
  def create
    @pickup_item = PickupItem.new(pickup_item_params)

    if @pickup_item.save
      render json: @pickup_item, status: :created, location: @pickup_item
    else
      render json: @pickup_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pickup_items/1
  def update
    if @pickup_item.update(pickup_item_params)
      render json: @pickup_item
    else
      render json: @pickup_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pickup_items/1
  def destroy
    @pickup_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup_item
      @pickup_item = PickupItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pickup_item_params
      params.require(:pickup_item).permit(:pickup_order_id, :item_id, :warehouse_item_id, :quantity)
    end
end
