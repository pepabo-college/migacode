FactoryGirl.define do
  factory :reply do
    contet Faker::Job.title
    author Faker::Book.author
  end
end
