json.extract! course, :id, :num, :title, :required, :professor_id, :category_id, :created_at, :updated_at
json.url course_url(course, format: :json)