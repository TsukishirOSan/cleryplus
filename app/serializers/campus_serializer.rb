class CampusSerializer < ActiveModel::Serializer
  attributes :name, :campus_id, :city, :state
  has_many :survey_years
end
