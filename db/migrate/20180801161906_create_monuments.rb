class CreateMonuments < ActiveRecord::Migration[5.2]
  def change
    create_table :monuments do |t|

      t.belongs_to :order, index: true
      t.string :monument_type
      t.string :single_or_double
      t.string :length
      t.string :width
      t.string :height
      t.string :color
      t.monetize :price
      
      t.timestamps
    end
  end
end
