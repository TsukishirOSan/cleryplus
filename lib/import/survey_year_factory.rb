class SurveyYearFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :name, :campus_id, :men_total, :women_total

  Contract nil => SurveyYear
  def make
    SurveyYear.where(name: name,
                     campus_id: campus_id)
      .first_or_create(men_total: men_total,
                       women_total: women_total)
  end
end
