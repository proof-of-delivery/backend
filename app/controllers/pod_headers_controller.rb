class PodHeadersController < ApplicationController
  before_action :set_pod_header, only: %i[ show update destroy ]

  # GET /pod_headers
  def index
    @pod_headers = PodHeader.all

    render json: @pod_headers
  end

  # GET /pod_headers
  def filter
    @q = PodHeader.ransack(params[:q])
    @pod_headers = @q.result

    render json: @pod_headers
  end

  def generate 
    @pickup_order = PickupOrder.find(params[:id])
    @pod_header = PodHeader.create(
      id: @pickup_order.id,
      pickup_order: @pickup_order
    )

    @packaging_details = PackagingDetail.where(pickup_order_id: @pickup_order.id)

    @packaging_details.each do |packaging_detail|
      @pod_item = PodItem.create(
        packaging_detail: @packaging_detail,
        pod_header: @pod_header
      )
    end

    render json: @pod_header
  end

  # GET /pod_headers/1
  def show
    render json: @pod_header
  end

  # POST /pod_headers
  def create
    @pod_header = PodHeader.new(pod_header_params)

    if @pod_header.save
      render json: @pod_header, status: :created, location: @pod_header
    else
      render json: @pod_header.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pod_headers/1
  def update
    if @pod_header.update(pod_header_params)
      render json: @pod_header
    else
      render json: @pod_header.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pod_headers/1
  def destroy
    @pod_header.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pod_header
      @pod_header = PodHeader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pod_header_params
      params.require(:pod_header).permit(:pickup_order_id)
    end
end
