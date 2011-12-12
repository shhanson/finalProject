class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :content

      t.timestamps
    end
    #add_index :reviews, :user_id
  end
  
  def self.down
    drop_table :reviews
  end
end
