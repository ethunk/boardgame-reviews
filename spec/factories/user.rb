FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "User#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    role 'user'
  end
end
