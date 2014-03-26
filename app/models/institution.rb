class Institution < ActiveRecord::Base
  has_many :campuses, class_name: 'Campus'

  validates :name, presence: true
  validates :unit_id, presence: true, numericality: true
end
