FactoryGirl.define do
  factory :project do
    name { Faker::App.name }
    code_climate_id { Faker::Bank.swift_bic }
    code_climate_snippet { Faker::Book.title }
    code { Faker::Lorem.characters(10) }
    rails_version { Faker::App.semantic_version }
    ruby_version { Faker::App.semantic_version }
    database { "MongoDB" }
    other_details { Faker::App.author }
    company
  end
end
