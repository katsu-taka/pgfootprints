class AddUseridToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :userid, :integer
  end
end
