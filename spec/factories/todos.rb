# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    description FFaker::Lorem.phrase
    deadline Time.zone.now
    done false

    trait :uncompleted do
      done false
    end

    trait :completed do
      done true
    end
  end
end
