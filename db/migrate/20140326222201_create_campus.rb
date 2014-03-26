class CreateCampus < ActiveRecord::Migration
  def change
    create_table :campus do |t|
      t.string :name
      t.integer :institution_id
      t.integer :campus_id

      t.timestamps
    end
  end
end
