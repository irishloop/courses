class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.includes(:semester)
    @categories = Category.all

    @fall_courses = @courses.where(semesters: { name: 'Fall'})
    @spring_courses = @courses.where(semesters: { name: 'Spring'})
    @summer_courses = @courses.where(semesters: { name: 'Summer'})

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_multiple
    @courses = Course.order('num ASC')
  end

  def update_multiple
    @courses = Course.all
    @courses.each do |course|
      hash = {}
      hash[:num] = params[:course][course.id.to_s][:num]
      hash[:title] = params[:course][course.id.to_s][:title]
      hash[:required] = params[:course][course.id.to_s][:required]
      hash[:offered] = params[:course][course.id.to_s][:offered]
      hash[:professor_id] = params[:course][course.id.to_s][:professor_id]
      hash[:category_id] = params[:course][course.id.to_s][:category_id]
      hash[:semester_id] = params[:course][course.id.to_s][:semester_id]
      unless course.update_attributes(hash)
        flash[:error] = course.errors
        redirect_to edit_multiple_courses_path
      end
    end
    flash[:notice] = "Courses saved successfully!"
    redirect_to edit_multiple_courses_path
  end

  def get_professors
    respond_to do |format|
      format.js
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    if params[:add_professor]
      @new_faculty = CourseFaculty.new
      @new_faculty.course_id = @course.id
      @new_faculty.professor_id = params[:course][:faculty_id]
      # byebug
      if @new_faculty.save
        redirect_to @course, notice: 'Professor added to course'
      else
        render :edit
      end
    else
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to @course, notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def add_professor
    @course = Course.find(params[:id])
    respond_to do |format|
      format.js {render :layout => false}
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:num, :title, :required, :offered, :professor_id, :category_id, :semester_id)
    end


end
