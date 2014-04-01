# == Schema Information
#
# Table name: survey_years
#
#  id          :integer          not null, primary key
#  name        :integer
#  campus_id   :integer
#  men_total   :integer
#  women_total :integer
#  created_at  :datetime
#  updated_at  :datetime
#  address     :text
#  zip         :string(255)
#  total       :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey_year do
    sequence(:name) {|n| 2000 + n }
    men_total 500
    women_total 500
    total 1000
    sequence(:address) {|n| "Address #{n}" }
    sequence(:zip) {|n| "12#{n}00" }

    campus
  end
end
