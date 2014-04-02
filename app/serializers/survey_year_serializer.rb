class SurveyYearSerializer < ActiveModel::Serializer
  attributes :name, :men_total, :women_total, :total, :address, :zip
  has_many :assault_stats
end
