json.array! @jobs do |job|
  json.id job.id
  json.title job.job_title
  json.summary job.job_summary
end