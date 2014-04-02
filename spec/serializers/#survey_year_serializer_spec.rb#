require 'spec_helper'

describe SurveyYearSerializer do
  let(:survey_year) { FactoryGirl.build(:survey_year) }
  subject { SurveyYearSerializer.new(survey_year).as_json }

  it { should have_key(:name) }
  it { should have_key(:men_total) }
  it { should have_key(:women_total) }
  it { should have_key(:total) }
  it { should have_key(:address) }
  it { should have_key(:zip) }
end
