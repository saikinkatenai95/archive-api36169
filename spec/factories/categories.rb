FactoryBot.define do
  factory :category do
    name          {Faker::Name.initials(number: 4)}
  end
end
