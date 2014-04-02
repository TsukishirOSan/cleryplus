# Idempotently produces an {SurveyYear} for a given institution in a
# campus' corresponding survey year
class SurveyYearFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :name, :campus_id, :men_total, :women_total, :total, :address, :zip

  Contract nil => SurveyYear
  # Construct or return the existing SurveyYear in accordance with
  # attributes provided to the factory
  #
  # @api public
  # @example Assuming an instance named survey_year_factory
  #   survey_year_factory.make #=> instance of SurveyYear
  # @return [SurveyYear] the constructed assault stat
  def make
    SurveyYear.where(name: name,
                     campus_id: campus_id)
      .first_or_create(men_total: men_total,
                       women_total: women_total,
                       address: address,
                       total: total,
                       zip: zip)
  end
end
