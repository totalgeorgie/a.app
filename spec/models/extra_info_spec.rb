# == Schema Information
#
# Table name: extra_infos
#
#  id           :integer          not null, primary key
#  linkedin_url :string(255)
#  source_place :string(255)
#  objective    :string(800)
#  experience_1 :string(1000)
#  experience_2 :string(1000)
#  education_1  :string(1000)
#  education_2  :string(1000)
#  other        :string(500)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe ExtraInfo do
  pending "add some examples to (or delete) #{__FILE__}"
end
