# == Schema Information
#
# Table name: secret_keys
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  valid      :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class SecretKey < ActiveRecord::Base
  def self.generate_key!
  	SecretKey.create!(code: SecureRandom.urlsafe_base64)
  end
end
