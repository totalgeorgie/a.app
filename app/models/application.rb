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
	belongs_to :job
	belongs_to :user
	validates :job_id, presence: true 
	validates :user_id, presence: true 

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

end
