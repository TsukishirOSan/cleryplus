class InstitutionSerializer < ActiveModel::Serializer
  attributes :name
  has_many :campuses
end
