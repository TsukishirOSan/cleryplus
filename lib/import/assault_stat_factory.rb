class AssaultStatFactory
  include Contracts
  include ActiveModel::Model

  attr_accessor :name, :forcible, :non_forcible, :total, :survey_year_id

  NAME_CONVERSION_TABLE = {
    'On-campus'              => 'On-Campus',
    'Off-campus'             => 'Off-Campus',
    'Total on or off campus' => 'Both',
    'Both'                   => 'Both',
    'Off-Campus'             => 'Off-Campus',
    'On-Campus'              => 'On-Campus'
  }

  Contract nil => AssaultStat
  def make
    usable_name = determine_name(name)
    Rails.logger.info("Building '#{usable_name}' AssaultStat for SurveyYear #{survey_year_id}")
    AssaultStat
      .where(name: usable_name,
             survey_year_id: survey_year_id)
      .first_or_create(forcible: forcible,
                       non_forcible: non_forcible,
                       total: total)
  end

  Contract String => String
  def determine_name(raw_name)
    NAME_CONVERSION_TABLE.fetch(raw_name)
  end
end
