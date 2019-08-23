FactoryBot.define do
  factory :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {FFaker::Lorem.characters 6}
    is_admin {true}
  end
end
