FactoryBot.define do
  factory :course do
    name { 'Ruby on Rails development' }
    start_date { 34.days.after }
  end
end
