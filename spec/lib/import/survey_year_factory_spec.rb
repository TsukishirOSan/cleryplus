require 'spec_helper'

describe SurveyYearFactory do
  let(:survey_year) { FactoryGirl.build(:survey_year) }

  let(:attributes) do
    {
      :name        => survey_year.name,
      :campus_id   => survey_year.campus_id,
      :men_total   => survey_year.men_total,
      :women_total => survey_year.women_total,
      :address     => survey_year.address,
      :zip         => survey_year.zip
    }
  end

  let(:survey_year_factory) { SurveyYearFactory.new(attributes) }

  describe '#make' do
    context 'given no existing SurveyYear' do
      it 'Survey_Year' do
        expect { survey_year_factory.make.save! }.to change(SurveyYear, :count).by(1)
      end
    end

    context 'given an existing SurveyYear' do
      it 'Survey_Year' do
        survey_year.save!
        expect { survey_year_factory.make.save! }.to change(SurveyYear, :count).by(0)
      end
    end
  end

end
