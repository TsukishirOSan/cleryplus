require 'zlib'

namespace :export do
  desc "Dump giant JSON file"

  task :json => :environment do
    Rails.logger.tagged("JSON Export") do
      serializable_institutions = []

      Rails.logger.info("Loading and pre-processing #{Institution.model_name.human.pluralize}")

      Institution.includes(:campuses => {:survey_years => :assault_stats}).find_in_batches do |group|
        Rails.logger.info("Converting #{Institution.model_name.human} batch of #{group.length}")

        group.each do |institution|
          serializable_institutions.push InstitutionSerializer.new(institution).as_json
        end
      end

      Rails.logger.info("Serializing #{serializable_institutions.length} to JSON")
      json = Oj.dump(serializable_institutions)
      Rails.logger.info("Rendered #{json.length} bytes of JSON")

      raw_output_path = Rails.root.join('tmp', 'export.json').to_s

      File.open(raw_output_path, 'wb') do |f|
        Rails.logger.info("Writing to #{raw_output_path}")
        f << json
      end

      Rails.logger.info("Wrote to #{raw_output_path}")

      gzipped_output_path = [raw_output_path, 'gz'].join('.')

      Zlib::GzipWriter.open(gzipped_output_path) do |gz|
        Rails.logger.info("Writing to #{gzipped_output_path}")
        gz << json
      end

      Rails.logger.info("Wrote to #{gzipped_output_path}")

      Rails.logger.info("Done!")
    end
  end
end
