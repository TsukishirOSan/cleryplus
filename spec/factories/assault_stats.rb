# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assault_stat do
    name "Both"
    forcible 100
    non_forcible 100
    total 200

    survey_year
  end
end
