class AddBloggerIdToComments < ActiveRecord::Migration[6.1]
  def change

    add_column :comments, :blogger_id, :integer

  end
end
