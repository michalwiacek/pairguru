FactoryBot.define do
  factory :comment do
      text { Faker::Fallout.quote }
      association :user
      association :movie
  end
end
