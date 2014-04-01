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
#  total       :integer
#

class SurveyYear < ActiveRecord::Base
  include Contracts

  belongs_to :campus
  has_many :assault_stats, dependent: :destroy

  validates :name, presence: true, numericality: true
  validates :campus_id, presence: true

  validate :ensure_totals_match_up

  private
  Contract nil => Bool
  def ensure_totals_match_up
    if (men_total.to_i + women_total.to_i) == total
      output = true
    else
      self.errors.add(:total, "total must equal (men_total + women_total)")
      output = false
    end

    output
  end

end
