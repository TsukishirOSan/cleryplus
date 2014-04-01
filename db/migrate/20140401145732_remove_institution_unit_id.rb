class RemoveInstitutionUnitId < ActiveRecord::Migration
  def change
    Institution.transaction do
      remove_column :institutions, :unit_id
    end
  end
end
