FactoryBot.define do
    factory :seller do
      sequence(:username) { Faker::Internet.username(specifier: 6..12) }
      password { "password" }
      sequence(:email) { Faker::Internet.email }
      state { Faker::Address.state }
    end
end