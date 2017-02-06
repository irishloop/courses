class Professor < ApplicationRecord
  has_many :courses
  has_many :course_faculties

  def fullname
    "#{lastname}, #{firstname}"
  end
end
