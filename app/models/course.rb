class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :professor, optional: true
  belongs_to :category
end
