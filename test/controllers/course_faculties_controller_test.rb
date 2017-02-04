require 'test_helper'

class CourseFacultiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_faculty = course_faculties(:one)
  end

  test "should get index" do
    get course_faculties_url
    assert_response :success
  end

  test "should get new" do
    get new_course_faculty_url
    assert_response :success
  end

  test "should create course_faculty" do
    assert_difference('CourseFaculty.count') do
      post course_faculties_url, params: { course_faculty: { course_id: @course_faculty.course_id, professor_id: @course_faculty.professor_id } }
    end

    assert_redirected_to course_faculty_url(CourseFaculty.last)
  end

  test "should show course_faculty" do
    get course_faculty_url(@course_faculty)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_faculty_url(@course_faculty)
    assert_response :success
  end

  test "should update course_faculty" do
    patch course_faculty_url(@course_faculty), params: { course_faculty: { course_id: @course_faculty.course_id, professor_id: @course_faculty.professor_id } }
    assert_redirected_to course_faculty_url(@course_faculty)
  end

  test "should destroy course_faculty" do
    assert_difference('CourseFaculty.count', -1) do
      delete course_faculty_url(@course_faculty)
    end

    assert_redirected_to course_faculties_url
  end
end
