class Institution < ActiveRecord::Base
  validates :name, presence: true
  validates :unit_id, presence: true, numericality: true
end
