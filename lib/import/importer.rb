class Importer
  include ActiveModel::Model
  include Contracts

  attr_accessor :pathname, :gzip, :io

  Contract nil => ArrayOf[HashOf[Symbol, Maybe[String]]]
  def records
    Rails.logger.info("Importer attempting to load import records")

    if pathname.present?
      Rails.logger.info("Pathname provided for import: #{pathname}")
      output = CsvImporter.new(pathname).to_hashes
      Rails.logger.info("Imported #{output.length} records")
    else
      Rails.logger.fatal(Rainbow("No pathname provided for import!").red)
      fail "No pathname given"
    end

    output
  end

  Contract nil => ArrayOf[Institution]
  def import!
    records.map do |record|
      handle(record)
    end
  end

  Contract HashOf[Symbol, Maybe[String]] => Institution
  def handle(record)
    Rails.logger.info("Handling record for #{record[:institution_name]}")

    institution = InstitutionFactory.new(:name => record[:institution_name]).make

    campus = CampusFactory.new(
      :name => record[:campus_name],
      :institution_id => institution.id,
      :city => record[:city],
      :campus_id => record[:campus_id],
    ).make


    survey_year = SurveyYearFactory.new(
      :name        => record[:survey_year],
      :men_total   => record[:men_total],
      :women_total => record[:women_total],
      :total       => population_total(record),
      :address     => record[:address],
      :zip         => record[:zip],
      :campus_id   => campus.id
    ).make

    institution
  end

  Contract HashOf[Symbol, Or[String,Num,nil]] => Num
  def population_total(record_hash)
    total = record_hash.fetch(:total, 0)
    calculated_total = (record_hash[:men_total].to_i + record_hash[:women_total].to_i)

    total == calculated_total ? total : calculated_total
  end
end
