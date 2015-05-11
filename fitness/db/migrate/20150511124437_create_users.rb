class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.boolean :gender
      t.string :email
      t.integer :rank
      t.boolean :is_administrator
      t.text :description
      t.timestamps null: false
    end
  end
end
