FactoryGirl.define do
  factory :user do
    name            { Faker::Name.name }
    email           { Faker::Internet.email }
    password "userpassword"
    password_confirmation "userpassword"

    after(:create) do |user|
      temp_group = create(:group)
      create(:message, user: user, group: temp_group)
      create(:group_user, user: user, group: create(:group))
    end
  end
end
