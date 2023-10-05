# frozen_string_literal: true

class PackagingDetailsController < ApplicationController
  before_action :set_packaging_detail, only: %i[show update destroy]

  def index
    packaging_details = PackagingDetail.all
    render json: packaging_details
  end

  # GET /packaging_details
  def filter
    @q = PackagingDetail.ransack(params[:q])
    @q.result

    render json: @packaging_details
  end

  # GET /packaging_details/1
  def show
    render json: @packaging_detail
  end

  # POST /packaging_details
  def create
    @packaging_detail = PackagingDetail.new(packaging_detail_params)

    if @packaging_detail.save
      render json: @packaging_detail, status: :created, location: @packaging_detail
    else
      render json: @packaging_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packaging_details/1
  def update
    if @packaging_detail.update(packaging_detail_params)
      render json: @packaging_detail
    else
      render json: @packaging_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packaging_details/1
  def destroy
    @packaging_detail.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_packaging_detail
    @packaging_detail = PackagingDetail.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def packaging_detail_params
    params.require(:packaging_detail).permit(:package_type, :weight, :length, :width, :height, :cbm)
  end
end
