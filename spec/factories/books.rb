FactoryBot.define do
    factory :book do
        name { "#{Faker::Name.prefix} #{Faker::Name.first_name}" }
        author { Faker::Name.name }
        year { Faker::Number.between(from: 1700, to: 2026) }
    end
end