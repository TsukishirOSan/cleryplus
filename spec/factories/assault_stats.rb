# == Schema Information
#
# Table name: assault_stats
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  forcible       :integer
#  non_forcible   :integer
#  total          :integer
#  survey_year_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

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
