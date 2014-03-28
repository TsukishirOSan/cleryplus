# == Schema Information
#
# Table name: campus
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  institution_id :integer
#  campus_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  address        :text
#  city           :string(255)
#  state          :string(255)
#  zip            :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campus do
    sequence(:name) {|i| "Campus #{i}" }
    sequence(:campus_id) {|i| i }

    institution
  end
end
