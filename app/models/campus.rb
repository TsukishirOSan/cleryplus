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

class Campus < ActiveRecord::Base
  belongs_to :institution, inverse_of: :campuses

  validates :name, presence: true
  validates :campus_id, presence: true, numericality: true
end
