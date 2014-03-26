class Campus < ActiveRecord::Base
  belongs_to :institution, inverse_of: :campuses

  validates :name, presence: true
  validates :campus_id, presence: true, numericality: true
end
