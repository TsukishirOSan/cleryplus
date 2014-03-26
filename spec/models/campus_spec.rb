require 'spec_helper'

describe Campus do
  let(:campus) { FactoryGirl.build(:campus) }

  it { should belong_to(:institution) }

  describe '#valid?' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:campus_id) }
    it { should validate_numericality_of(:campus_id) }

    context 'given valid attributes' do
      it { expect(campus).to be_valid }
    end
  end
end
