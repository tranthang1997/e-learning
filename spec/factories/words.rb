FactoryBot.define do
  factory :word do
    name {FFaker::Name.name}
    meaning {FFaker::Name.name}
    speech {FFaker::Name.name}
    example {FFaker::Lorem.characters 10}
  end
end
