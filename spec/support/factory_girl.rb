require "factory_girl"

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :show do
    sequence(:title) { |n| "show #{n}" }
    sequence(:url) { |n| "http://www.#{n}show.com" }
    start_year "1991"
    end_year "1999"
    genre "cartoon"
  end
end
