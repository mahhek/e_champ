class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo,
    :styles => {
    :thumb=> "100x100#",
    :small  => "400x400>" },    
    :path => ":rails_root/public/images/photos/:id/:style/:basename.:extension"
end
