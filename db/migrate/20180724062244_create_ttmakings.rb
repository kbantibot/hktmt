class CreateTtmakings < ActiveRecord::Migration[5.2]
  def change
    create_table :ttmakings do |t|
      t.string :tt_name
      t.integer :tt_date
      t.integer :tt_start
      t.integer :tt_fin
      t.belongs_to :post
      t.integer :post_id

      t.timestamps
    end
  end
end
