class PickupOrdersController < ApplicationController
  before_action :set_pickup_order, only: %i[ show update destroy ]

  # GET /pickup_orders
  def index
    @pickup_orders = PickupOrder.all

    render json: @pickup_orders
  end

  # GET /pickup_orders/1
  def show
    render json: @pickup_order
  end

  # POST /pickup_orders
  def create
    @pickup_order = PickupOrder.new(pickup_order_params)

    if @pickup_order.save
      render json: @pickup_order, status: :created, location: @pickup_order
    else
      render json: @pickup_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pickup_orders/1
  def update
    if @pickup_order.update(pickup_order_params)
      render json: @pickup_order
    else
      render json: @pickup_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pickup_orders/1
  def destroy
    @pickup_order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup_order
      @pickup_order = PickupOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pickup_order_params
      params.require(:pickup_order).permit(:customer_id, :pickup_date, :pickup_time, :pickup_order_no)
    end
end
