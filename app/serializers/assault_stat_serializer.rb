class AssaultStatSerializer < ActiveModel::Serializer
  attributes :name, :forcible, :non_forcible, :total
end
