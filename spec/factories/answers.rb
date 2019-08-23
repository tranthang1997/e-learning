FactoryBot.define do
  factory :answer do
    content {FFaker::Lorem.characters 10}
  end
end
