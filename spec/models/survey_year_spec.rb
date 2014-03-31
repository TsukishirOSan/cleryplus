require 'spec_helper'

describe SurveyYear do
  let(:survey_year) { FactoryGirl.build(:survey_year) }


  it { should belong_to(:campus) }
  it { should validate_presence_of(:campus_id) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:name) }

  describe '#valid' do
    context 'given valid attributes' do
      it('validates') { expect(survey_year).to be_valid }
    end
  end
end
