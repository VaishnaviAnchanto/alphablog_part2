class AddBloggerIdToArticles < ActiveRecord::Migration[6.1]
    def change
      add_column :articles, :blogger_id, :integer
      add_index :articles, :blogger_id
    end
  end