class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.where(nil)
    @sections = @sections.course_id(params[:course_id]) if params[:course_id].present?
    @sections = @sections.location_id(params[:location_id]) if params[:location_id].present?
    @sections = @sections.instructor_id(params[:instructor_id]) if params[:instructor_id].present?
    @sections = @sections.semester_id(params[:semester_id]) if params[:semester_id].present?
    @sections = @sections.start_after(params[:start_after]) if params[:start_after].present?
    @sections = @sections.start_before(params[:start_before]) if params[:start_before].present?
    @sections = @sections.end_before(params[:end_before]) if params[:end_before].present?
    @sections = @sections.end_after(params[:end_after]) if params[:end_after].present?
    @sections = @sections.exclude_days(params[:exclude_days]) if params[:exclude_days].present?
    @sections = @sections.include_days(params[:include_days]) if params[:include_days].present?

    @sections = @sections.open if params[:open].present? && params[:open]
    @sections = @sections.closed if params[:closed].present? && params[:closed]

    if params[:verbose].present? && params[:verbose]
      
      render json: @sections, :include => [{course: {only:  [:name, :long_name, :department_id]}},
                                           {instructor: {only:  [:first_name, :last_name]}},
                                           {semester: {only:  [:name, :id]}},
                                           {location: {only:  [:name, :institution_id]}}]
      
    else
      render json: @sections
    end


    # render json: @sections
    
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
