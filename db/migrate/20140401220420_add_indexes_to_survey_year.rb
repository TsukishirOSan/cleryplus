class AddIndexesToSurveyYear < ActiveRecord::Migration
  def change
    SurveyYear.transaction do
      [:name, :campus_id].each do |column_name|
        add_index :survey_years, column_name
      end
    end
  end
end
