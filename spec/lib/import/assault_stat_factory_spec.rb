require 'spec_helper'

describe AssaultStatFactory do
  let(:assault_stat) { FactoryGirl.build(:assault_stat) }

  let(:attributes) do
    {
      :name           => assault_stat.name,
      :forcible       => assault_stat.forcible,
      :non_forcible   => assault_stat.non_forcible,
      :total          => assault_stat.total,
      :survey_year_id => assault_stat.survey_year_id
    }
  end

  let(:assault_stat_factory) { AssaultStatFactory.new(attributes) }

  describe '#make' do
    context 'given no existing Assaultstat' do
      it 'Assault_Stat' do
        expect { assault_stat_factory.make.save! }.to change(AssaultStat, :count).by(1)
      end
    end

    context 'given an existing Assaultstat' do
      it 'Assault_Stat' do
        assault_stat.save!
        expect { assault_stat_factory.make.save! }.to change(AssaultStat, :count).by(0)
      end
    end
  end

end
