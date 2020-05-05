course_names = [
  'Курс разработки на Ruby',
  'Курс разработки на Python',
  'Курс разработки на Java',
  'Курс разработки на Go',
  'Курс Devops'
]

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) if AdminUser.find_by(email: 'admin@example.com').nil?

course_names.each do |course_name|
  course = Course.create!(
    name: course_name,
    start_date: Faker::Date.between_except(
      from: 1.year.ago,
      to: 1.year.from_now,
      excepted: Date.today
    )
  )

  3.times do |number|
    StudentGroup.create!(
      name: "Группа ##{Faker::Number.number(digits: 3)}",
      course_id: course.id
    )
  end
end
