require 'csv'

# Imports and structures CSV data into nice hashes
class CsvImporter < Struct.new(:csv_path)
  include Contracts


  # maps between text columns and constants
  # @api public
  # @return Hash{String => Symbol}
  HEADER_MAP = {
    'Survey year' => :survey_year,
    'Unitid' => :unit_id,
    'Institution name' => :institution_name,
    'Campus ID' => :campus_id,
    ' Campus Name' => :campus_name,
    'Institution Size' => :institution_size,
    'Murder/Non-negligent manslaughter' => :murder_non_negligent_manslaughter,
    'Negligent manslaughter' => :negligent_manslaughter,
    'Sex offenses - Forcible' => :sex_offenses_forcible,
    'Sex offenses - Non-forcible' => :sex_offenses_non_forcible,
    'Robbery' => :robber,
    'Aggravated assault' => :aggravated_assault,
    'Burglary' => :burglary,
    'Motor vehicle theft' => :motor_vehicle_theft,
    'Arson' => :arson
  }

  Contract nil => ArrayOf[ArrayOf[Maybe[String]]]
  # reads in CSV, removes bogus header row and returns real rows
  # @api private
  # @return [Array<Array<String,nil>>] array of rows
  def rows
    unless @rows.present?
      @rows = CSV.read(csv_path)
      # get rid of crappy ["Criminal Offenses - On campus"]
      @rows.shift
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
      Hash[headers.zip(row)]
    end
  end
end
