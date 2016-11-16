FactoryGirl.define do
  factory :comment do
    user
    idea
    body "Yuri rules"
  end
end
