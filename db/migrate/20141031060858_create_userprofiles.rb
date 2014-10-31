class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.integer :userid, null: false
      t.string :name, null: false
      t.string :bloodtype
      t.datetime :birthday
      t.string :address
      t.binary :photo

      t.timestamps
    end
  end
end
