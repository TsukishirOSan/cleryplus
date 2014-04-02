require 'spec_helper'

describe CampusSerializer do
  let(:campus) { FactoryGirl.build(:campus) }
  subject { CampusSerializer.new(campus).as_json }

  it { should have_key(:name) }
  it { should have_key(:campus_id) }
  it { should have_key(:city) }
  it { should have_key(:state) }
end
