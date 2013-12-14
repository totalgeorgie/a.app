# == Schema Information
#
# Table name: common_apps
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  current_city  :string(255)
#  grad_year     :integer
#  read_type     :string(255)
#  listen_speak  :string(255)
#  time_in_china :integer
#  cover_letter  :string(255)
#  resume        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe CommonApp do
  pending "add some examples to (or delete) #{__FILE__}"
end
