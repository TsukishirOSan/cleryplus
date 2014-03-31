class SurveyYear < ActiveRecord::Base
  belongs_to :campus

  validates :name, presence: true, numericality: true
  validates :campus_id, presence: true
end
