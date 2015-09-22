require "factory_girl"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :program do
    sequence(:title) { |n| "program #{n}" }
    sequence(:url) { |n| "http://www.#{n}program.com" }
    start_year "1991"
    end_year "1999"
    genre "cartoon"
  end

  factory :review do
    rating 5
    sequence(:body) { |n| "Celtics are #{n} champions (but really 17 times)" }
    score 0
    association :program
    association :user
  end
end
