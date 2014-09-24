class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all

    render json: @departments
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])

    render json: @department
  end

  # POST /departments
  # POST /departments.json
  # def create
  #   @department = Department.new(params[:department])

  #   if @department.save
  #     render json: @department, status: :created, location: @department
  #   else
  #     render json: @department.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /departments/1
  # # PATCH/PUT /departments/1.json
  # def update
  #   @department = Department.find(params[:id])

  #   if @department.update(params[:department])
  #     head :no_content
  #   else
  #     render json: @department.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /departments/1
  # # DELETE /departments/1.json
  # def destroy
  #   @department = Department.find(params[:id])
  #   @department.destroy

  #   head :no_content
  # end
end
