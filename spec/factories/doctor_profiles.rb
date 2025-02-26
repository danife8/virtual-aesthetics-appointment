# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_profile do
    association :user
    specialization { Faker::Job.field }
    location { Faker::Address.city }
  end
end
