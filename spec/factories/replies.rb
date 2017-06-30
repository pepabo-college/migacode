FactoryGirl.define do
  factory :reply do
    association :issue
    content Faker::Job.title
    author Faker::Book.author

    factory :invalid_reply_params do
      content nil
    end

  end
end
