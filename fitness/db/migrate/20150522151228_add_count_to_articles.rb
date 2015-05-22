class AddCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :count, :integer
  end
end
