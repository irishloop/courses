class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :professor, optional: true
  belongs_to :category
  has_many :course_faculties

  def listing
    "#{num}: #{title}"
  end

  def faculty
    @course_faculty = CourseFaculty.where(course_id: id)
    @professors = []
    unless professor_id.nil?
      @professors.push(professor)
    end
    @course_faculty.each do |faculty|
      @professors.push(faculty.professor)
    end
    # May be empty
    return @professors
  end

  def faculty_listing
    @professors = faculty.map { |p| p.lastname }
    @professors.join(", ")
  end
end
