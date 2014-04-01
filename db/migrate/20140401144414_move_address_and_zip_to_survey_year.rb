class MoveAddressAndZipToSurveyYear < ActiveRecord::Migration
  def change
    SurveyYear.transaction do
      remove_column :campus, :address
      remove_column :campus, :zip

      add_column :survey_years, :address, :text
      add_column :survey_years, :zip, :string
    end
  end
end
