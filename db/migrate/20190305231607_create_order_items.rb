class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
    	t.belongs_to :order
    	t.belongs_to :item

      t.timestamps
    end
  end
end
