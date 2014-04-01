class AddIndexesToCampuses < ActiveRecord::Migration
  def change
    Campus.transaction do
      [:name, :institution_id, :city, :state].each do |column_name|
        add_index :campus, column_name
      end
    end
  end
end
