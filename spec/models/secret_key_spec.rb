# == Schema Information
#
# Table name: secret_keys
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  still_valid :boolean          default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe SecretKey do
  pending "add some examples to (or delete) #{__FILE__}"
end
