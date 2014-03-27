class AddAddressColumnsToCampuses < ActiveRecord::Migration
  def change
    Campus.transaction do
      add_column :campus, :address, :text

      [:city, :state, :zip].each do |column_name|
        add_column :campus, column_name, :string
      end
    end
  end
end
