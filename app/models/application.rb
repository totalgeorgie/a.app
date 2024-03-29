# == Schema Information
#
# Table name: applications
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  job_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  shortlisted :boolean          default(FALSE)
#  status      :string(255)      default("SENT")
#

class Application < ActiveRecord::Base  
  STATUS_OPTIONS = ["Application Complete",
    "Materials Submitted",
    "Pending Interview",
    "Second Interview"]

  belongs_to :job, counter_cache: true
  belongs_to :user, counter_cache: true
  has_many :questions, through: :job
  has_many :answers, inverse_of: :application, dependent: :destroy

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

  scope :for_job, ->(job_id) do
    Application
      .includes(user: [common_app: [:cities, :industries]])
      .includes(questions: :answer)
      .where('applications.job_id = ?', job_id)
  end

  def self.build(job, appl = Application.new)
    job.questions.each do |question|
      appl.answers.build(question_id: question.id)
    end

    appl
  end

  def self.make_by_admin(params)
    app = Application.new
    app.user_id = params[:user_id]
    app.job_id = params[:job_id]
    
    app.questions.pluck(:id).each do |id|
      app.answers.new(question_id: id, content: 'N/A')
    end

    app
  end
end