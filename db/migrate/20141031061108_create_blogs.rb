class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :content
      t.binary :program
      t.binary :reference

      t.timestamps
    end
  end
end
