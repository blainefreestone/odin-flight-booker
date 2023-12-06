FactoryBot.define do
  factory :user do
    password { 'password' }
    sequence(:email) { |n| "email#{n}@email.com" }
  end
end
