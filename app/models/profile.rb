<<<<<<< HEAD
class Profile < ActiveRecord::Base
  belongs_to :user

  validates :hometown, :presence => {:message => 'Please fill in home town!'}

  has_attached_file :photo,
    :styles => {
    :thumb=> "100x100#",
    :small  => "400x400>" },    
    :path => ":rails_root/public/images/photos/:id/:style/:basename.:extension"
end
=======
class Profile < ActiveRecord::Base
  belongs_to :user

  validates :hometown, :presence => {:message => 'Please fill in home town!'}

  has_attached_file :photo,
    :styles => {
    :thumb=> "100x100#",
    :small  => "400x400>" },    
    :path => ":rails_root/public/images/photos/:id/:style/:basename.:extension"
end
>>>>>>> 81876f719b27be3a9e4332cf54fa11a25d332e45
