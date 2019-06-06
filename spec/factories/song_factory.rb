# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    title { 'The hooves' }
    released { 'Mar 12 2000' }
    duration { '10 min.' }
  end
end
