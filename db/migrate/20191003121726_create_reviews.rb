class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :nickname
      t.text :review
      t.integer :player_id
      t.timestamps
    end
  end
end