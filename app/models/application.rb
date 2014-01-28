# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  job_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Application < ActiveRecord::Base
	belongs_to :job, counter_cache: true
	belongs_to :user, counter_cache: true

  validates :job_id, presence: true 
	validates :user_id, presence: true 

  after_create :set_customerio
  after_destroy :set_customerio

  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers, allow_destroy: true

    
  def self.build(job_id)
     application = self.new

     job = Job.find(job_id)

     job.questions.each do |question|
       application.answers.build(question_id: question.id)
     end

     application
  end

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

 private

  def set_customerio
    user = self.user
    $customerio.identify(
      id: user.id,
      jobs_applied_to: user.applications.length
    )
  end

end
