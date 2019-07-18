FactoryBot.define do
  factory :article do
    author        { Faker::Name.name }
    title         { Faker::Lorem.sentence }
    description   { Faker::Lorem.paragraph }
    url           { Faker::Internet.url }
    url_to_image  { Faker::Internet.url }
    published_at  { DateTime.current }
    content       { Faker::Lorem.paragraph 20 }
    resource
    search
  end
end
