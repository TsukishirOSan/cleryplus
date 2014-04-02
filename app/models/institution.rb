# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Institution < ActiveRecord::Base
  has_many :campuses, class_name: 'Campus', dependent: :destroy
  has_many :survey_years, through: :campuses

  validates :name, presence: true
end
