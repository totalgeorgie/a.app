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
#  salary_pref      :integer          default(0)
#  china_contrib    :text(1000)
#  progress         :integer          default(5)
#  has_video        :boolean          default(FALSE)
#  china_time       :text(1000)
#  job_interest     :text(1000)
#  china_goals      :text(1000)
#  culture_pref     :integer          default(0)
#

require 'spec_helper'

describe CommonApp do
  pending "add some examples to (or delete) #{__FILE__}"
end
