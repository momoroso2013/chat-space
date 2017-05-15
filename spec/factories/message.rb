FactoryGirl.define do

  factory :message do
    text            { Faker::Lorem.sentence }
    image           { Faker::Avatar.image }
    group_id        { Faker::Number.between(1.10) }
    user_id         { Faker::Number.between(1.10) }
  end
end
