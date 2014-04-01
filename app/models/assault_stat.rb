class AssaultStat < ActiveRecord::Base
  include Contracts
  CATEGORIZATIONS = ['On-Campus', 'Off-Campus', 'Both']

  belongs_to :survey_year

  validates :name, presence: true, inclusion: { in: CATEGORIZATIONS }
  validates :survey_year_id, presence: true

  validate :ensure_totals_match_up


  private
  Contract nil => Bool
  def ensure_totals_match_up
    if (forcible.to_i + non_forcible.to_i) == total
      output = true
    else
      self.errors.add(:total, "total must equal (forcible + non_forcible)")
      output = false
    end

    output
  end
end
