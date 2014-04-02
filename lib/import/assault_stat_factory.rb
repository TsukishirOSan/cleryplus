# Idempotently produces an {AssaultStat} for a given institution in a
# campus' corresponding survey year
class AssaultStatFactory
  include Contracts
  include ActiveModel::Model

  attr_accessor :name, :forcible, :non_forcible, :total, :survey_year_id

  # Table to map from CSV stat designations to the ones used
  # internally. You know, the ones with proper capitalization and
  # such.
  #
  # @api private
  # @return [Hash{String => String}]
  NAME_CONVERSION_TABLE = {
    'On-campus'              => 'On-Campus',
    'Off-campus'             => 'Off-Campus',
    'Total on or off campus' => 'Both',
    'Both'                   => 'Both',
    'Off-Campus'             => 'Off-Campus',
    'On-Campus'              => 'On-Campus'
  }

  Contract nil => AssaultStat
  # Construct or return the existing AssaultStat in accordance with
  # attributes provided to the factory
  #
  # @note using `first_or_create` here might cause perf issues but a
  # default of `create` could mean one less query per method call but
  # would lose the idempotent properties.
  #
  # @api public
  # @example Assuming an instance named assault_stat_factory
  #   assault_stat_factory.make #=> instance of AssaultStat
  # @return [AssaultStat] the constructed assault stat
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
  # Map input CSV stat categorizations to their internal
  # representations
  #
  # @api private
  # @param raw_name [String] the input categorization
  # @raise [KeyError] if the {AssaultStatFactory::NAME_CONVERSION_TABLE} lacks the input key
  # @return [String] the converted name
  def determine_name(raw_name)
    NAME_CONVERSION_TABLE.fetch(raw_name)
  end
end
