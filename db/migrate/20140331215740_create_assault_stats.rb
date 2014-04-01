class CreateAssaultStats < ActiveRecord::Migration
  def change
    create_table :assault_stats do |t|
      t.string :name
      t.integer :forcible
      t.integer :non_forcible
      t.integer :total
      t.integer :survey_year_id

      t.timestamps
    end
  end
end
