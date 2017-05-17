class RemoveProductNameFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :product_name, :string
  end
end
