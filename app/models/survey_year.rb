# == Schema Information
#
# Table name: survey_years
#
#  id          :integer          not null, primary key
#  name        :integer
#  campus_id   :integer
#  men_total   :integer
#  women_total :integer
#  created_at  :datetime
#  updated_at  :datetime
#  address     :text
#  zip         :string(255)
#

class SurveyYear < ActiveRecord::Base
  belongs_to :campus
  has_many :assault_stats

  validates :name, presence: true, numericality: true
  validates :campus_id, presence: true
end
