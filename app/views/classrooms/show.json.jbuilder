
json.classroom do
  json.id @classroom.id
  json.name @classroom.name

  json.students @classroom.students do |student|
    json.extract! student,
      :id,
      :dob
  end

  json.courses @classroom.courses do |course|
    json.extract! course,
      :id,
      :title,
      :user_id,
      :classroom_id,
      :subject_id,
      :course_date,
      :status,
      :created_at,
      :updated_at
  end
end
