FactoryGirl.define do
  factory :user do
    username 'username'
    sequence(:email) { |i| "fcbb99#{i}@mail.ru "}
    password '123456'
    confirmed_at '2018-12-31 15:32:10'
  end
end
