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

class Institution < ActiveRecord::Base
  has_many :campuses, class_name: 'Campus'

  validates :name, presence: true
  validates :unit_id, presence: true, numericality: true
end
