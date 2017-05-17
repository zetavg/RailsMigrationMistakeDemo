class AddAmountToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :amount, :integer

    reversible do |dir|
      dir.up do
        Order.find_each do |order|
          product = Product.find_by(name: order.product_name)
          order.update_attributes!(amount: product.price)
        end
      end
    end
  end
end
