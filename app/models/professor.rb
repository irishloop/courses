class Professor < ApplicationRecord
  has_many :courses
  has_many :course_faculties
end
