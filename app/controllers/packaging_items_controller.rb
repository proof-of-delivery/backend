class PackagingItemsController < ApplicationController
  before_action :set_packaging_item, only: %i[ show update destroy ]

  # GET /packaging_items
  def index
    @packaging_items = PackagingItem.all

    render json: @packaging_items
  end

  # GET /packaging_items/1
  def show
    render json: @packaging_item
  end

  # POST /packaging_items
  def create
    @packaging_item = PackagingItem.new(packaging_item_params)

    if @packaging_item.save
      render json: @packaging_item, status: :created, location: @packaging_item
    else
      render json: @packaging_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packaging_items/1
  def update
    if @packaging_item.update(packaging_item_params)
      render json: @packaging_item
    else
      render json: @packaging_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packaging_items/1
  def destroy
    @packaging_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packaging_item
      @packaging_item = PackagingItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def packaging_item_params
      params.require(:packaging_item).permit(:packaging_detail_id, :pickup_item_id, :quantity)
    end
end
