class AddUserIdColumnInArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :user_id, :string
  end
end
