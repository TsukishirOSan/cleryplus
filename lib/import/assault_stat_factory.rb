class AssaultStatFactory
  include Contracts
  include ActiveModel::Model

  attr_accessor :name, :forcible, :non_forcible, :total, :survey_year_id

  Contract nil => AssaultStat
  def make
    AssaultStat
      .where(name: name,
             survey_year_id: survey_year_id)
      .first_or_create(forcible: forcible,
                       non_forcible: non_forcible,
                       total: total)
  end
end
