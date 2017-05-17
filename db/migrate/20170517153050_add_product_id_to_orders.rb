class AddProductIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :product_id, :integer
    add_index :orders, :product_id

    reversible do |dir|
      dir.up do
        Order.find_each do |order|
          product = Product.find_by(name: order.product_name)
          order.update_attributes!(product_id: product.id)
        end
      end
    end
  end
end
