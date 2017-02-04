json.extract! course_faculty, :id, :course_id, :professor_id, :created_at, :updated_at
json.url course_faculty_url(course_faculty, format: :json)