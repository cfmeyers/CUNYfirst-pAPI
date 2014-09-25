class InstitutionsController < ApplicationController
  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all

    render json: @institutions

    rescue ActiveRecord::RecordNotFound
      render json: {message: 'Resource not found'}, status: 404


  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
    @institution = Institution.find(params[:id])

    render json: @institution

  rescue ActiveRecord::RecordNotFound
    render json: {message: 'Resource not found'}, status: 404

  end

  # # POST /institutions
  # # POST /institutions.json
  # def create
  #   @institution = Institution.new(params[:institution])

  #   if @institution.save
  #     render json: @institution, status: :created, location: @institution
  #   else
  #     render json: @institution.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /institutions/1
  # PATCH/PUT /institutions/1.json
  # def update
  #   @institution = Institution.find(params[:id])

  #   if @institution.update(params[:institution])
  #     head :no_content
  #   else
  #     render json: @institution.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /institutions/1
  # # DELETE /institutions/1.json
  # def destroy
  #   @institution = Institution.find(params[:id])
  #   @institution.destroy

  #   head :no_content
  # end
end
