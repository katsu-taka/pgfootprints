class Userprofile < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id"
  
  def uploaded_picture=(picture_field)
    self.ptype = picture_field.content_type.chomp
    self.photo = picture_field.read
    self.pname = base_part_of(picture_field.original_filename)
  end
  
  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/,'')
  end
  
end
