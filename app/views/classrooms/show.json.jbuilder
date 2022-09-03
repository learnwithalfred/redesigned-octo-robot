json.classroom do
  json.id @classroom.id
  json.name @classroom.name

  json.students @classroom.students do |student|
    json.extract! student,
      :id,
      :dob,
      :contact

      json.user do
        json.extract! student.user,
          :id,
          :name,
          :email,
          :address
      end
      json.classroom do
        json.extract! student.classroom,
          :id,
          :name
      end
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
      :updated_at,
      :content

      json.subject do
        json.extract! course.subject,
          :id,
          :name
      end
     json.user do
        json.extract! course.user,
          :id,
          :name,
          :email
      end
      json.classroom do
        json.extract! course.classroom,
          :id,
          :name
      end
      json.comments course.comments do |comment|
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
end
