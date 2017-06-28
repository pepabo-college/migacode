FactoryGirl.define do
  factory :issue do
    sequence :title {Faker::Book.title}
    sequence :mail_address {Faker::Internet.email}
    sequence :content {Faker::Job.title}
    sequence :notification_flg {[true,false].shuffle.shift}
    sequence :author {Faker::Book.author}
  end

end
