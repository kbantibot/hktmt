class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :num
      t.integer :money
      t.integer :date
      t.integer :start
      t.integer :fin
      
      t.integer :num_male
      t.integer :num_female
      t.string :money
      
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
