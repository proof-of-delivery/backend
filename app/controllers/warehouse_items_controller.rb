class WarehouseItemsController < ApplicationController
  before_action :set_warehouse_item, only: %i[ show update approve destroy request_quantity confirm_quantity ]

  def index 
    @warehouse_items = WarehouseItem.all
    render json: @warehouse_items
  end

  # GET /warehouse_items
  def filter
    @q = WarehouseItem.ransack(params[:q])
    @warehouse_items = @q.result(:distinct => true).includes(:warehouse_order, :item)
    
    render json: @warehouse_items
  end

  # GET /warehouse_items/1
  def show
    render json: @warehouse_item
  end

  # POST /warehouse_items
  def create
    @warehouse_item = WarehouseItem.new(warehouse_item_params)

    if @warehouse_item.save
      render json: @warehouse_item, status: :created, location: @warehouse_item
    else
      render json: @warehouse_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouse_items/1
  def update
    if @warehouse_item.update(warehouse_item_params)
      render json: @warehouse_item
    else
      render json: @warehouse_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /warehouse_items/1
  def destroy
    @warehouse_item.destroy
  end

  def request_quantity
    requested_quantity = params[:requested_quantity].to_i
    @warehouse_item.request_quantity(requested_quantity)
    render json: @warehouse_item
  end

  # POST /warehouse_items/1/confirm
  def confirm_quantity
    confirmed_quantity = params[:confirmed_quantity].to_i
    @warehouse_item.confirm_quantity(confirmed_quantity)
    render json: @warehouse_item
  end

  def confirmed_warehouse_items
    @warehouse_items = WarehouseItem.where(warehouse_order_id: params[:warehouse_order_id]).where("total_confirmed_quantity > 0")
    render json: @warehouse_items
  end

  def approve
    if @warehouse_item.update(status: 'approved')
      render json: @warehouse_item
    else
      render json: @warehouse_item.errors, status: :unprocessable_entity
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse_item
      @warehouse_item = WarehouseItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warehouse_item_params
      params.require(:warehouse_item).permit(:warehouse_order_id, :item_id, :quantity, :requested_quantity, :confirmed_quantity, :total_requested_quantity, :total_confirmed_quantity, :picked_up_quantity, :status)
    end
end
