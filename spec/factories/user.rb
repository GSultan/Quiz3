FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    sequence(:email) {|n| "MyString#{n}@aasddsa.com" }
    # sequence(:name)        { |n| "#{Faker::Lorem.sentence}-#{n}" }
    password_digest "MyString"
  end
end
