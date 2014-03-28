# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  unit_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :institution do
    sequence(:name) {|n| "Institution #{n}" }
    sequence(:unit_id) {|n| n + 10 }
  end
end
