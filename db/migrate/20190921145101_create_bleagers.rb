class CreateBleagers < ActiveRecord::Migration[5.2]
  def change
    create_table :bleagers do |t|
      t.string  :team_name
      t.text    :player_url
      t.integer :number
      t.string  :name_ja
      t.string  :name_en
      t.string  :position
      t.string  :birthplace
      t.string  :birthday
      t.integer :cm
      t.integer :kg
      t.string  :nationality
      t.string  :highschool
      t.string  :college
      t.text    :comment

      t.timestamps
    end
  end
end