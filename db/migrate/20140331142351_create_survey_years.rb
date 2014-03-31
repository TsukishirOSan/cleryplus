class CreateSurveyYears < ActiveRecord::Migration
  def change
    create_table :survey_years do |t|
      t.integer :name
      t.integer :campus_id
      t.integer :men_total
      t.integer :women_total

      t.timestamps
    end
  end
end
