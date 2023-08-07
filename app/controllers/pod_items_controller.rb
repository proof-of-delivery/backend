class PodItemsController < ApplicationController
  before_action :set_pod_item, only: %i[ show update destroy ]

  # GET /pod_items
  def index
    @pod_items = PodItem.all
    render json: @pod_items
  end

  # GET /pod_items/1
  def show
    render json: @pod_item
  end

  # POST /pod_items
  def create
    @pod_item = PodItem.new(pod_item_params)

    if @pod_item.save
      render json: @pod_item, status: :created, location: @pod_item
    else
      render json: @pod_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pod_items/1
  def update
    if @pod_item.update(pod_item_params)
      render json: @pod_item
    else
      render json: @pod_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pod_items/1
  def destroy
    @pod_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pod_item
      @pod_item = PodItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pod_item_params
      params.fetch(:pod_item, {})
    end
end
