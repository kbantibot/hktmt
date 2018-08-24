class CreateCalras < ActiveRecord::Migration[5.2]
  def change
    create_table :calras do |t|
      t.integer :rice
      t.integer :noodle
      t.integer :fork
      t.integer :soju
      t.integer :beer
      t.integer :post_id
      t.belongs_to :post 


      t.timestamps
    end
  end
end
