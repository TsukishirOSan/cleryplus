class CampusFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :campus_id, :name, :institution_id, :address, :city, :state, :zip

  Contract nil => Campus
  def make
    Campus
      .where(name: name,
             institution_id: institution_id,
             city: city,
             state: state)
      .first_or_create(campus_id: campus_id,
                       address: address,
                       zip: city)
  end
end
