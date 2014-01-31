# == Schema Information
#
# Table name: potentials
#
#  id         :integer          not null, primary key
#  level      :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  job_id     :integer
#

class Potential < ActiveRecord::Base
  belongs_to :job
  belongs_to :user


  def find_potential
    #Cities, Industries, Positions + 1 per city  // Out of each option job has
    #Has video? + 2 //Out of 2
    #How filled in is the profile? 1-3*profile progress // Out of 3

    job = self.job
    user = self.user
    total = job.cities.length + job.industries.length + job.positions.length + 2 + 3
    potential = 0

    user.common_app.cities.each do |city|
      potential +=1 if job.cities.include?(city)
    end

    user.common_app.industries.each do |industry|
      potential +=1 if job.industries.include?(industry)
    end

    user.common_app.positions.each do |position|
      potential +=1 if job.positions.include?(position)
    end

    potential += 2 if user.video

    potential += (3.0*user.common_app.progress/100)

    (100.0 * potential / total).round
  end


end
