class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :status
      t.date :date_order_created
      t.date :date_approval_sent
      t.date :date_order_approved
      t.date :date_order_cut
    	t.date :date_monument_ordered
    	t.date :date_set
    	t.string :ordered_by
    	t.string :address
    	t.string :phone_number
    	t.string :email
    	t.monetize :total_fees
    	t.monetize :balance_due

      t.timestamps
    end
  end
end
