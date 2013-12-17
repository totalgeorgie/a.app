class Video < ActiveRecord::Base
 belongs_to :user
 validates :user_id, presence: true
 # must create validates for the other form stuff. 
 
end

