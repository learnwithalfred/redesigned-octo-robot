json.extract! course, :id, :user_id, :classroom_id, :subject_id, :course_date, :status, :title, :created_at, :updated_at
json.url course_url(course, format: :json)
