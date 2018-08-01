FactoryBot.define do
    factory :monument do
        monument_type {Faker::String.random(8)}
        single_or_double 'Single'
        length { Faker::Number.between(1,50) }
        width { Faker::Number.between(1,50) }
        height { Faker::Number.between(1,50) }
        color { Faker::Color.color_name}
    end
end