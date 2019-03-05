class AddGoodOrderToCarts < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :good_order, foreign_key: true
  end
end
