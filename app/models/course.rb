class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :professor, optional: true
  belongs_to :category

  def listing
    "#{num}: #{title}"
  end

  def faculty_listing
    @course_faculty = CourseFaculty.where(course_id: id)
    @professors = []
    if professor_id.nil?
      return ""
    else
      @professors.push(professor.lastname)
      @course_faculty.each do |faculty|
        @professors.push(faculty.professor.lastname)
      end
    end
    @professors.join(", ")
  end
end
