class CreateRoars < ActiveRecord::Migration
  def change
    create_table :roars do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
