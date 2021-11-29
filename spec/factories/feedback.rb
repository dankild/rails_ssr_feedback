FactoryBot.define do
    factory :feedback do
        name { Faker::Name.name }
        email  { Faker::Internet.email }
        body { Faker::Lorem.paragraph }
    end
end
