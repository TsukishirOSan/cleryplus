require 'spec_helper'

describe InstitutionFactory do
  let(:institution) { FactoryGirl.build(:institution) }

  let(:attributes) do
    {
      :name    => institution.name,
      :unit_id => institution.unit_id
    }
  end

  let(:institution_factory) { InstitutionFactory.new(attributes) }

  describe '#make' do
    context 'given no existing Institution' do
      it 'Institution' do
        expect { institution_factory.make.save! }.to change(Institution, :count).by(1)
      end
    end

    context 'given an existing Institution' do
      it 'Institution' do
        institution.save!
        expect { institution_factory.make.save! }.to change(Institution, :count).by(0)
      end
    end
  end
end
