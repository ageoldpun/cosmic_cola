class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :units
    end
  end
end
