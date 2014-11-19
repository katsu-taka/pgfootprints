class AddPhotoattributeToUserprofiles < ActiveRecord::Migration
  def change
    add_column :userprofiles, :ptype, :string
    add_column :userprofiles, :pname, :string
  end
end
