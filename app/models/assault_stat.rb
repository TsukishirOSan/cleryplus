# == Schema Information
#
# Table name: assault_stats
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  forcible       :integer
#  non_forcible   :integer
#  total          :integer
#  survey_year_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class AssaultStat < ActiveRecord::Base
  include Contracts
  # List of acceptable names (categorizations for assault stats)
  #
  # @api private
  # @return [Array<String>]
  CATEGORIZATIONS = ['On-Campus', 'Off-Campus', 'Both']

  belongs_to :survey_year

  validates :name, presence: true, inclusion: { in: CATEGORIZATIONS }
  validates :survey_year_id, presence: true

  validate :ensure_totals_match_up


  private
  Contract nil => Bool
  def ensure_totals_match_up
    if [forcible, non_forcible, total].map(&:present?).any?
      if (forcible.to_i + non_forcible.to_i) == total
        output = true
      else
        self.errors.add(:total, "total must equal (forcible + non_forcible)")
        output = false
      end
    else
      output = true
    end

    output
  end
end
