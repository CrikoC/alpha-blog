class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :user_id
    add_column :articles, :user_id, :integer
  end
end
