json.array! @jobs do |job|
  json.title = job.job_title
  json.job_summary = job.job_summary
  
  json.industries do
    json.array! job.industries do |industry|
      json.name industry.name
    end
  end

  json.cities do 
    json.array! job.cities do |city|
      json.name city.name
    end
  end
end