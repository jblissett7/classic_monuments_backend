# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    status { Faker::String.random(8) }
    date_order_created { Faker::Date.backward(14) }
    ordered_by { Faker::Name.name }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
