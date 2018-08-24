class CreateCalculators < ActiveRecord::Migration[5.2]
  def change
    create_table :calculators do |t|
      t.integer :bab
      t.integer :sul
      t.belongs_to :post
      t.integer :post_id

      t.timestamps
    end
  end
end
