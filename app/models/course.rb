class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :professor
  belongs_to :category
end
