FactoryBot.define do
  factory :question do
    question {FFaker::Lorem.characters 10}
  end
end
