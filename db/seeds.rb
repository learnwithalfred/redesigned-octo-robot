  # frozen_string_literal: true

  # admin user for test
  User.create!(
    [{
      name: Faker::Name.name,
      email: "admin@example.com",
      password: "password",
      password_confirmation: "password",
      gender: "female",
      address: Faker::Address.community,
      role: 3
    }])

  # student user for test
  User.create!(
    [{
      name: Faker::Name.name,
      email: "student@example.com",
      password: "password",
      password_confirmation: "password",
      gender: "female",
      address: Faker::Address.community,
      role: 1
    }])

  # other users
  20.times do
    User.create!(
      [{
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "welcome",
        password_confirmation: "welcome",
        gender: "male",
        address: Faker::Address.community,
        role: Faker::Number.between(from: 1, to: 3)
      }])
  end

  # student users list
  50.times do
    User.create!(
      [{
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "welcome",
        password_confirmation: "welcome",
        gender: "male",
        address: Faker::Address.community,
        role: 1
      }])
  end

  class_num = 0
  10.times do
    class_num = class_num + 1
    Classroom.create!(
      [{
        name: "Stage #{class_num}",
        role: class_num
      }])
  end

  5.times do
    Subject.create!(
      [{
        name: Faker::Educator.course_name
      }])
  end

  15.times do
    Announcement.create!(
      [{
        title: Faker::Lorem.paragraph(sentence_count: 4),
        content: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false)
      }])
  end

  50.times do
    Course.create!(
      [{
        title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
        course_date: Faker::Date.between(from: "2022-08-01", to: "2022-12-12"),
        status: "pending",
        content: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false),
        user_id: User.where(role: "admin").first.id,
        subject_id: Faker::Number.between(from: 1, to: 5),
        classroom_id: Faker::Number.between(from: 1, to: 5)
      }])
  end

  30.times do
    Comment.create!(
      [{
        content: Faker::Lorem.paragraph(sentence_count: 4),
        user_id: Faker::Number.between(from: 23, to: 50),
        course_id: Faker::Number.between(from: 1, to: 30)
      }])

  end

  user_num = 22
  50.times do
    user_num = user_num + 1
    Student.create!(
      [{
        user_id: user_num,
        classroom_id: Faker::Number.between(from: 1, to: 5),
        contact: Faker::PhoneNumber.cell_phone_in_e164,
        father: Faker::Name.name,
        mother: Faker::Name.name,
        about: Faker::Lorem.paragraph(sentence_count: 2),
        dob: Faker::Date.between(from: "2000-09-23", to: "2018-09-25")
      }])
  end

  # test student
  Student.create!(
    [{
      user_id: 2,
      classroom_id: 1,
      contact: Faker::PhoneNumber.cell_phone_in_e164,
      father: Faker::Name.name,
      mother: Faker::Name.name,
      about: Faker::Lorem.paragraph(sentence_count: 2),
      dob: Faker::Date.between(from: "2000-09-23", to: "2018-09-25")
    }])
