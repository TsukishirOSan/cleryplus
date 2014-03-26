require 'csv'

# Imports and structures CSV data into nice hashes
class CsvImporter < Struct.new(:csv_path)
  include Contracts

  Contract nil => ArrayOf[ArrayOf[Maybe[String]]]
  # reads in CSV, removes bogus header row and returns real rows
  # @return [Array<Array<String,nil>>] array of rows
  def rows
    unless @rows.present?
      @rows = CSV.read(csv_path)
      # get rid of crappy ["Criminal Offenses - On campus"]
      @rows.shift
    end

    @rows
  end

  Contract nil => ArrayOf[HashOf[String,Or[String,nil]]]
  # zips header row and row data to make hashes
  # @return [Array<Hash{String => String,nil}>] the hashes
  def to_hashes
    headers = rows.first
    rows[1..rows.length].map do |row|
      Hash[headers.zip(row)]
    end
  end
end
