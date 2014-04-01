# Create a new Institution or return an existing one based on given attributes
class InstitutionFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :name

  Contract nil => Institution
  def make
    Institution
      .where(name: name)
      .first_or_create
  end
end
