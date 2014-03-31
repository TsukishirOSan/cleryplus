class CampusFactory
  include ActiveModel::Model
  include Contracts

  attr_accessor :campus_id, :name, :institution_id, :address, :city, :state, :zip

  Contract nil => Campus
  def make
    Campus
      .where(campus_id: campus_id,
             institution_id: institution_id)
      .first_or_create(name: name,
                       address: address,
                       city: city,
                       state: state)
  end
end
