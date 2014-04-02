require 'spec_helper'

describe InstitutionSerializer do
  let(:institution) { FactoryGirl.build(:institution) }
  subject { InstitutionSerializer.new(institution).as_json }

  it { should have_key(:name) }
end
