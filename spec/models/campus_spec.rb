# == Schema Information
#
# Table name: campus
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  institution_id :integer
#  campus_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  address        :text
#  city           :string(255)
#  state          :string(255)
#  zip            :string(255)
#

require 'spec_helper'

describe Campus do
  let(:campus) { FactoryGirl.build(:campus) }

  it { should belong_to(:institution) }
  it { should have_many(:survey_years) }

  describe '#valid?' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:campus_id) }
    it { should validate_numericality_of(:campus_id) }

    context 'given valid attributes' do
      it { expect(campus).to be_valid }
    end
  end
end
