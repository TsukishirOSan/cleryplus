# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  unit_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Institution do
  let (:institution) { FactoryGirl.build(:institution) }

  it { should have_many(:campuses) }

  describe '#valid?' do
    it { should validate_presence_of(:name) }

    context 'given valid attributes' do
      it { expect(institution).to be_valid }
    end
  end
end
