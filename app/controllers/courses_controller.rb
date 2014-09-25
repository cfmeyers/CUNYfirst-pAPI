class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    render json: @courses

    rescue ActiveRecord::RecordNotFound
      render json: {message: 'Resource not found'}, status: 404


  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    render json: @course

    rescue ActiveRecord::RecordNotFound
      render json: {message: 'Resource not found'}, status: 404
  end

  # POST /courses
  # POST /courses.json
  # def create
  #   @course = Course.new(params[:course])

  #   if @course.save
  #     render json: @course, status: :created, location: @course
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /courses/1
  # # PATCH/PUT /courses/1.json
  # def update
  #   @course = Course.find(params[:id])

  #   if @course.update(params[:course])
  #     head :no_content
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /courses/1
  # # DELETE /courses/1.json
  # def destroy
  #   @course = Course.find(params[:id])
  #   @course.destroy

  #   head :no_content
  # end
end
