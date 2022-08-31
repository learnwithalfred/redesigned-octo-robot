json.course do
  json.id @course.id
  json.user_id @course.user_id
  json.classroom_id @course.classroom_id
  json.subject_id @course.subject_id
  json.course_date @course.course_date
  json.status @course.status
  json.title @course.title
  json.created_at @course.created_at
  json.updated_at @course.updated_at
  json.content @course.content

  json.subject do
    json.extract! @course.subject,
      :id,
      :name
  end
  json.user do
    json.extract! @course.user,
      :id,
      :name,
      :email
  end
  json.classroom do
    json.extract! @course.classroom,
      :id,
      :name
  end
  json.comments @course.comments do |comment|
    json.extract! comment,
      :id,
      :content,
      :created_at

    json.user do
      json.extract! comment.user,
        :id,
        :name
    end
  end
end


