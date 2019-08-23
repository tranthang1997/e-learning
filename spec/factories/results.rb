FactoryBot.define do
  factory :result do
    grade {FFaker::Random.rand(0..9)}
    answers {FFaker::Lorem.characters 20}
  end
end
