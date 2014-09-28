class SemestersController < ApplicationController
  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all

    render json: @semesters
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
    @semester = Semester.find(params[:id])

    render json: @semester
  end

  # POST /semesters
  # POST /semesters.json
  # def create
  #   @semester = Semester.new(params[:semester])

  #   if @semester.save
  #     render json: @semester, status: :created, location: @semester
  #   else
  #     render json: @semester.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /semesters/1
  # # PATCH/PUT /semesters/1.json
  # def update
  #   @semester = Semester.find(params[:id])

  #   if @semester.update(params[:semester])
  #     head :no_content
  #   else
  #     render json: @semester.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /semesters/1
  # # DELETE /semesters/1.json
  # def destroy
  #   @semester = Semester.find(params[:id])
  #   @semester.destroy

  #   head :no_content
  # end
end
