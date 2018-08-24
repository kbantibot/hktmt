class CreatePls < ActiveRecord::Migration[5.2]
  def change
    create_table :pls do |t|
      t.string :place
      t.integer :month
      t.integer :date
      t.integer :people

      t.timestamps
    end
  end
end
