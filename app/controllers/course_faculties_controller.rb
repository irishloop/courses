class CourseFacultiesController < ApplicationController
  before_action :set_course_faculty, only: [:show, :edit, :update, :destroy]

  # GET /course_faculties
  # GET /course_faculties.json
  def index
    @course_faculties = CourseFaculty.all
  end

  # GET /course_faculties/1
  # GET /course_faculties/1.json
  def show
  end

  # GET /course_faculties/new
  def new
    @course_faculty = CourseFaculty.new
  end

  # GET /course_faculties/1/edit
  def edit
  end

  # POST /course_faculties
  # POST /course_faculties.json
  def create
    @course_faculty = CourseFaculty.new(course_faculty_params)

    respond_to do |format|
      if @course_faculty.save
        format.html { redirect_to @course_faculty, notice: 'Course faculty was successfully created.' }
        format.json { render :show, status: :created, location: @course_faculty }
      else
        format.html { render :new }
        format.json { render json: @course_faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_faculties/1
  # PATCH/PUT /course_faculties/1.json
  def update
    respond_to do |format|
      if @course_faculty.update(course_faculty_params)
        format.html { redirect_to @course_faculty, notice: 'Course faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_faculty }
      else
        format.html { render :edit }
        format.json { render json: @course_faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_faculties/1
  # DELETE /course_faculties/1.json
  def destroy
    course = @course_faculty.course_id
    @course_faculty.destroy
    respond_to do |format|
      format.html { redirect_to course_url(course), notice: 'Faculty member removed from course.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_faculty
      @course_faculty = CourseFaculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_faculty_params
      params.require(:course_faculty).permit(:course_id, :professor_id)
    end
end
