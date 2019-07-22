FactoryBot.define do
  factory :resource do
    source_id   { Faker::Internet.slug }
    name        { "#{Faker::Company.name} #{Faker::Name.name}" }
  end
end
