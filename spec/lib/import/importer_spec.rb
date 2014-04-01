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

    context 'assault stats' do
      it { expect { importer.import! }.to change(AssaultStat, :count).by(19) }
    end
  end

  describe '#population_total' do
    context 'given an existing total' do
      let(:attrs) do
        {
          :men_total   => 10,
          :women_total => 15,
          :total       => 25
        }
      end

      subject { importer.population_total(attrs) }
      it { should eq(attrs[:total]) }
    end

    context 'given a non-existant total' do
      context 'nil' do
        let(:attrs) do
          {
            :men_total   => 10,
            :women_total => 15,
            :total       => nil
          }
        end

        subject { importer.population_total(attrs) }
        it { should eq(25) }
      end

      context '0' do
        let(:attrs) do
          {
            :men_total   => 10,
            :women_total => 15,
            :total       => 0
          }
        end

        subject { importer.population_total(attrs) }
        it { should eq(25) }
      end
    end
  end
end
