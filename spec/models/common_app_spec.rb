# == Schema Information
#
# Table name: common_apps
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  current_city     :string(255)
#  grad_year        :integer
#  resume           :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  industries_count :integer          default(0), not null
#  cities_count     :integer          default(0), not null
#  nationality      :string(255)
#  ideal_salary     :integer
#  chinese_ability  :string(255)
#  bonus_question   :text(1000)
#

require 'spec_helper'

describe CommonApp do
  pending "add some examples to (or delete) #{__FILE__}"
end
