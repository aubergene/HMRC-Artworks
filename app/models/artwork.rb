class Artwork < ActiveRecord::Base

  belongs_to  :contact
  has_many    :visit_requests
  

end
