# Idempotently produces an {Institution} for a given institution
class InstitutionFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :name

  Contract nil => Institution
  # Construct or return the existing Institution in accordance with
  # attributes provided to the factory
  #
  # @api public
  # @example Assuming an instance named institution_factory
  #   institution_factory.make #=> instance of Institution
  # @return [Institution] the constructed institution
  def make
    Institution
      .where(name: name)
      .first_or_create
  end
end
