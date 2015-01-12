FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    account_id 1

    factory :admin do
      admin true
    end
  end

  factory :timecard do
    hours 8
    date 1.day.ago
    user
  end

  factory :crew do
    name "Alpha"
  end
end
