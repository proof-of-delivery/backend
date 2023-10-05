# frozen_string_literal: true

class WarehouseOrdersController < ApplicationController
  before_action :set_warehouse_order, only: %i[show update destroy]

  def index
    @warehouse_orders = WarehouseOrder.all
    render json: @warehouse_orders
  end

  # GET /warehouse_orders
  def filter
    @q = WarehouseOrder.ransack(params[:q])
    @warehouse_orders = @q.result(distinct: true).includes(:customer)

    render json: @warehouse_orders
  end

  # GET /warehouse_orders/1
  def show
    render json: @warehouse_order
  end

  # POST /warehouse_orders
  def create
    @warehouse_order = WarehouseOrder.new(warehouse_order_params)
    if @warehouse_order.save
      render json: @warehouse_order, status: :created, location: @warehouse_order
    else
      render json: @warehouse_order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouse_orders/1
  def update
    if @warehouse_order.update(warehouse_order_params)
      render json: @warehouse_order
    else
      render json: @warehouse_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /warehouse_orders/1
  def destroy
    @warehouse_order.destroy
  end

  def confirmed_warehouseorders
    @warehouse_orders = WarehouseOrder.joins(:warehouse_item).where("warehouse_items.total_confirmed_quantity > 0").where(customer_id: params[:customer_id]).distinct
    render json: @warehouse_orders
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_warehouse_order
    @warehouse_order = WarehouseOrder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def warehouse_order_params
    params.require(:warehouse_order).permit(:doc_no, :name_of_ship, :delivery_date, :delivery_address, :customer_id)
  end
end
