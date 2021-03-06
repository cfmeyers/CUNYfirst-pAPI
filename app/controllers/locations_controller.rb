class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    render json: @locations
  rescue ActiveRecord::RecordNotFound
    render json: {message: 'Resource not found'}, status: 404

  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    render json: @location
  rescue ActiveRecord::RecordNotFound
    render json: {message: 'Resource not found'}, status: 404


  end

  # POST /locations
  # POST /locations.json
  # def create
  #   @location = Location.new(params[:location])

  #   if @location.save
  #     render json: @location, status: :created, location: @location
  #   else
  #     render json: @location.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /locations/1
  # # PATCH/PUT /locations/1.json
  # def update
  #   @location = Location.find(params[:id])

  #   if @location.update(params[:location])
  #     head :no_content
  #   else
  #     render json: @location.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /locations/1
  # # DELETE /locations/1.json
  # def destroy
  #   @location = Location.find(params[:id])
  #   @location.destroy

  #   head :no_content
  # end
end
