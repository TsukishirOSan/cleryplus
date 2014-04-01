class AddTotalToSurveyYear < ActiveRecord::Migration
  def change
    SurveyYear.transaction do
      add_column :survey_years, :total, :integer
    end
  end
end
