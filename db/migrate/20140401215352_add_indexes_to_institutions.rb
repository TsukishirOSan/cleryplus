class AddIndexesToInstitutions < ActiveRecord::Migration
  def change
    Institution.transaction do
      add_index :institutions, :name
    end
  end
end
