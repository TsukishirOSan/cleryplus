require 'spec_helper'

describe Importer do
  let(:pathname) { Rails.root.join('spec', 'data', 'import_data.csv').to_s }
  let(:importer) { Importer.new(pathname: pathname) }

  describe '#records' do
    context 'pathname' do
      context 'provided' do
        it 'delegates to CsvImporter' do
          expect(CsvImporter).to receive(:new).and_call_original
          importer.records
        end
      end

      context 'not provided' do
        let(:importer) { Importer.new }
        it { expect { importer.records }.to raise_error }
      end
    end
  end

  describe '#import!' do
    context 'institutions' do
      it { expect { importer.import! }.to change(Institution, :count).by(4) }
    end

    context 'campuses' do
      it { expect { importer.import! }.to change(Campus, :count).by(4) }
    end

    context 'survey years' do
      it { expect { importer.import! }.to change(SurveyYear, :count).by(7) }
    end
  end
end
