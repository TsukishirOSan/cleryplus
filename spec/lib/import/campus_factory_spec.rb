require 'spec_helper'

describe CampusFactory do
  let(:campus) { FactoryGirl.build(:campus) }

  let(:attributes) do
    {
      :name           => campus.name,
      :campus_id      => campus.campus_id,
      :institution_id => campus.institution_id,
      :city           => campus.city,
      :state          => campus.state,
    }
  end

  let(:campus_factory) { CampusFactory.new(attributes) }

  describe '#make' do
    context 'given no existing Campus' do
      it 'Campus' do
        expect { campus_factory.make.save! }.to change(Campus, :count).by(1)
      end
    end

    context 'given an existing Campus' do
      it 'Campus' do
        campus.save!
        expect { campus_factory.make.save! }.to change(Campus, :count).by(0)
      end
    end
  end
end
