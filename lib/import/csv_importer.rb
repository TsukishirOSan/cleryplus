require 'csv'

# Imports and structures CSV data into nice hashes
class CsvImporter < Struct.new(:csv_path)
  include Contracts

  # map between text column headers and constants
  # @api public
  # @return Hash{String => Symbol}
  HEADER_MAP = {
    'year'                            => :survey_year,
    'on_or_off_campus'                => :on_or_off_campus,
    'INSTNM'                          => :institution_name,
    'BRANCH'                          => :campus_name,
    'Institution Size'                => :institution_size,
    'Address'                         => :address,
    'City'                            => :city,
    'State'                           => :state,
    'Zip'                             => :zip,
    'sector_cd'                       => :sector_cd,
    'sector_desc'                     => :sector_desc,
    'men_total'                       => :men_total,
    'women_total'                     => :women_total,
    'Total'                           => :total,
    'FORCIB'                          => :forcible,
    'NONFOR'                          => :non_forcible,
    'forcib_or_nonfor'                => :forcible_or_nonforcible,
    'rate_assault_per_student'        => :rate_assault_per_student,
    'rate_assault_per_male_student'   => :rate_assault_per_male_student,
    'rate_assault_per_female_student' => :rate_assault_per_female_student,
    'campus_id'                       => :campus_id
  }

  Contract nil => ArrayOf[ArrayOf[Maybe[String]]]
  # reads in CSV, removes bogus header row and returns real rows
  # @api private
  # @return [Array<Array<String,nil>>] array of rows
  def rows
    unless @rows.present?
      Rails.logger.info("Reading CSV from #{csv_path}")
      @rows = CSV.read(csv_path)
      Rails.logger.info("Read #{rows.length - 1} usable rows from CSV")
    end

    @rows
  end

  Contract nil => ArrayOf[HashOf[Symbol,Or[String,nil]]]
  # zips header row and row data to make hashes
  # @api public
  # @return [Array<Hash{Symbol => String,nil}>] the hashes
  def to_hashes
    headers = rows.first.map {|string_header| HEADER_MAP.fetch(string_header) }

    rows[1..rows.length].map do |row|
      Rails.logger.info("Constructing hash for #{Rainbow(row[2]).green} (#{row.first})")
      Hash[headers.zip(row)]
    end
  end
end
