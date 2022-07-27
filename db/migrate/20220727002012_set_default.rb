class SetDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :equipment_listings, :available, :boolean, default: true
  end
end
