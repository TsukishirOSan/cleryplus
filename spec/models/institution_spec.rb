require 'spec_helper'

describe Institution do
  let (:institution) { FactoryGirl.build(:institution) }

  it { should have_many(:campuses) }

  describe '#valid?' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:unit_id) }
    it { should validate_numericality_of(:unit_id) }

    context 'given valid attributes' do
      it { expect(institution).to be_valid }
    end
  end
end
