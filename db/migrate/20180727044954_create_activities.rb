class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      
      t.string :title
      t.text :content
      t.string :image
      
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
