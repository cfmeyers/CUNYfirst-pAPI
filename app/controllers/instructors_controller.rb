class InstructorsController < ApplicationController
  # GET /instructors
  # GET /instructors.json
  def index
    @instructors = Instructor.all

    render json: @instructors
  rescue ActiveRecord::RecordNotFound
    render json: {message: 'Resource not found'}, status: 404


  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
    @instructor = Instructor.find(params[:id])

    render json: @instructor
  rescue ActiveRecord::RecordNotFound
    render json: {message: 'Resource not found'}, status: 404


  end


  # POST /instructors
  # POST /instructors.json
  # def create
  #   @instructor = Instructor.new(params[:instructor])

  #   if @instructor.save
  #     render json: @instructor, status: :created, location: @instructor
  #   else
  #     render json: @instructor.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /instructors/1
  # # PATCH/PUT /instructors/1.json
  # def update
  #   @instructor = Instructor.find(params[:id])

  #   if @instructor.update(params[:instructor])
  #     head :no_content
  #   else
  #     render json: @instructor.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /instructors/1
  # # DELETE /instructors/1.json
  # def destroy
  #   @instructor = Instructor.find(params[:id])
  #   @instructor.destroy

  #   head :no_content
  # end
end
