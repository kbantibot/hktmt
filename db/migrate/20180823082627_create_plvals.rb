class CreatePlvals < ActiveRecord::Migration[5.2]
  def change
    create_table :plvals do |t|
      t.string :place
      t.integer :month
      t.integer :date
      t.string :plname
      t.string :price
      t.string :href
      t.integer :post_id
      t.belongs_to :post 

      t.timestamps
    end
  end
end
