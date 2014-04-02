require 'spec_helper'

describe AssaultStatSerializer do
  let(:assault_stat) { FactoryGirl.build(:assault_stat) }
  subject { AssaultStatSerializer.new(assault_stat).as_json }

  it { should have_key(:name) }
  it { should have_key(:forcible) }
  it { should have_key(:non_forcible) }
  it { should have_key(:total) }
end
