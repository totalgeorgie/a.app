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
#  ideal_salary     :string(255)
#  bonus_question   :text(1000)
#  progress         :integer          default(5)
#  has_video        :boolean          default(FALSE)
#  linkedin_link    :string(255)
#  bonus_choice     :text
#  china_time       :text(255)
#  job_interest     :string(255)
#  china_goals      :string(255)
#

require 'spec_helper'

describe CommonApp do
  pending "add some examples to (or delete) #{__FILE__}"
end
