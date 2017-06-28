FactoryGirl.define do
  factory :issue do
    title Faker::Book.title
    mail_address Faker::Internet.email
    content Faker::Job.title
    notification_flg [true,false].shuffle.shift
    author Faker::Book.author
  end
end
