FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    email { 'hello@ivanzabrodin.com' }
    student_group
  end
end
