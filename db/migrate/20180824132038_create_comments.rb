class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content
      t.integer :food_id
      
      t.belongs_to :food

      t.timestamps
    end
  end
end
