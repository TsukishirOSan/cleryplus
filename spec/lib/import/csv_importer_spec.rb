require 'spec_helper'

describe CsvImporter do
  let(:path) { Rails.root.join('spec', 'data', 'import_data.csv').to_s }
  let(:csv_importer) { CsvImporter.new(path) }

  describe '#rows' do
    context 'header row length' do
      it { expect(csv_importer.rows.first.length).to be > 1 }
    end
  end

  describe '#to_hashes' do
    context 'leaves out header row' do
      context 'output length' do
        it { expect(csv_importer.to_hashes.length).to eq(csv_importer.rows.length - 1) }
      end

      it 'sets hash keys to headers' do
        sorted_headers = csv_importer.rows.first.sort
        csv_importer.to_hashes.each do |hash|
          expect(hash.keys.sort).to eq(sorted_headers)
        end
      end
    end
  end
end
