# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    trait :patient do
      role { 'patient' }
    end

    trait :doctor do
      role { 'doctor' }
      doctor_profile { build(:doctor_profile) }
    end
  end
end
