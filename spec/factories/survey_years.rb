# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey_year do
    sequence(:name) {|n| 2000 + n }
    men_total 500
    women_total 500

    campus
  end
end
