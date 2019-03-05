class CreateGoodOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :good_orders do |t|

      t.timestamps
    end
  end
end
