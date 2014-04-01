require 'spec_helper'

describe AssaultStat do
  let(:assault_stat) { FactoryGirl.build(:assault_stat) }

  describe '#valid?' do
    it { should belong_to(:survey_year) }
    it { should validate_presence_of(:survey_year_id) }
    it { should validate_presence_of(:name) }
    it { should ensure_inclusion_of(:name).in_array(AssaultStat::CATEGORIZATIONS) }

    context 'given valid attributes' do
      it { expect(assault_stat).to be_valid }
    end

    context 'given invalid attributes' do
      context 'given an invalid total' do
        subject { assault_stat.total = assault_stat.forcible; assault_stat }
        it { should_not be_valid }
      end
    end
  end
end
