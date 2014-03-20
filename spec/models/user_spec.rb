# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  password_digest        :string(255)
#  remember_token         :string(255)
#  admin                  :boolean          default(FALSE)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  heat_id                :integer          default(2)
#  admin_note             :string(255)
#  progress               :integer          default(5)
#  applications_count     :integer
#  source_id              :integer
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
