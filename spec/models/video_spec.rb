# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  video_uuid :string(255)
#  question   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Video do
  pending "add some examples to (or delete) #{__FILE__}"
end
