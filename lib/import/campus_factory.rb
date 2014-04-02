# Idempotently produces a {Campus} for a given institutiona
class CampusFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :campus_id, :name, :institution_id, :city, :state

  Contract nil => Campus
  # Construct or return the existing Campus in accordance with
  # attributes provided to the factory
  #
  # @api public
  # @example Assuming an instance named campus_factory
  #   campus_factory.make #=> instance of Campus
  # @return [Campus] the constructed campus
  def make
    Campus
      .where(name: name,
             institution_id: institution_id,
             city: city,
             state: state)
      .first_or_create(campus_id: campus_id)
  end
end
