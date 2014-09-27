class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    if params[:course_id]
      course = Course.find(params[:course_id])
      render json: Section.where(course: course)
      
    elsif params[:start_after]
      start_after = params[:start_after]
      if /^\d\d:\d\d$/.match(start_after)
        @sections = Section.where("start_time > ?", start_after)
        render json: @sections
      else
        render json: {message: 'Badly formatted query.  Must be of form HH:MM'}, status: 400
      end

    elsif params[:start_before]
      start_before = params[:start_before]
      if /^\d\d:\d\d$/.match(start_before)
        @sections = Section.where("start_time < ?", start_before)
        render json: @sections
      else
        render json: {message: 'Badly formatted query.  Must be of form HH:MM'}, status: 400
      end

    elsif params[:end_after]
      end_after = params[:end_after]
      if /^\d\d:\d\d$/.match(end_after)
        @sections = Section.where("end_time > ?", end_after)
        render json: @sections
      else
        render json: {message: 'Badly formatted query.  Must be of form HH:MM'}, status: 400
      end

    elsif params[:end_before]
      end_before = params[:end_before]
      if /^\d\d:\d\d$/.match(end_before)
        @sections = Section.where("end_time < ?", end_before)
        render json: @sections
      else
        render json: {message: 'Badly formatted query.  Must be of form HH:MM'}, status: 400
      end



    else
      @sections = Section.all
      render json: @sections
    end
    rescue ActiveRecord::RecordNotFound
      render json: {message: 'Resource not found'}, status: 404


  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find(params[:id])

    render json: @section

  rescue ActiveRecord::RecordNotFound
    render json: {message: 'Resource not found'}, status: 404

  end

  # POST /sections
  # POST /sections.json
  # def create
  #   @section = Section.new(params[:section])

  #   if @section.save
  #     render json: @section, status: :created, location: @section
  #   else
  #     render json: @section.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /sections/1
  # # PATCH/PUT /sections/1.json
  # def update
  #   @section = Section.find(params[:id])

  #   if @section.update(params[:section])
  #     head :no_content
  #   else
  #     render json: @section.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /sections/1
  # # DELETE /sections/1.json
  # def destroy
  #   @section = Section.find(params[:id])
  #   @section.destroy

  #   head :no_content
  # end
end
