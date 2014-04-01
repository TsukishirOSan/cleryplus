class AddIndexesToAssaultStats < ActiveRecord::Migration
  def change
    AssaultStat.transaction do
      add_index :assault_stats, :name
      add_index :assault_stats, :survey_year_id
    end
  end
end
