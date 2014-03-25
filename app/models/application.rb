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
  has_many :questions, through: :job
  has_many :answers, inverse_of: :application, dependent: :destroy
  belongs_to :heatable, polymorphic: true
  belongs_to :job, counter_cache: true
  belongs_to :user, counter_cache: true

  validates :job_id, presence: true 
  validates :user_id, presence: true 
  validates :answers, presence: true
  
  accepts_nested_attributes_for :answers,
   allow_destroy: true, reject_if: :all_blank

  scope :with_dependents, -> do
    Application
       .includes(:job)
       .includes(:questions)
       .includes(:answers)
  end

  scope :for_job, -> (job_id) do 
    Application
      .includes(:user)
      .includes(:questions)
      .includes(:answers)
      .where('applications.job_id = ?', job_id)
  end

  def self.build(job, appl = Application.new)
    job.questions.each do |question|
      appl.answers.build(question_id: question.id)
    end

    appl
  end
end