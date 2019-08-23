FactoryBot.define do
  factory :course do
    name {FFaker::Name.name}
    description {FFaker::Lorem.paragraph 2}
  end
end
