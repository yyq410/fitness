class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	t.string :name
	t.string :password
	t.string :email
	t.string :age
	t.string :gender
	t.string :rank
	t.string :is_administrator
    end
  end
end
