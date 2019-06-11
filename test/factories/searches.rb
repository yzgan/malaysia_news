FactoryBot.define do
  factory :search do
    status { rand(2) }
    total_results { rand(50) }
  end
end
