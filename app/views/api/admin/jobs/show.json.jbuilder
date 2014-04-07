json.applications do 
  json.array! @applications do |app|
    json.id app.id
    json.user_id app.user_id
    json.job_id app.job_id
    json.shortlisted app.shortlisted
    json.status app.status
    json.user do 
      json.name app.user.name
      json.source app.user.source ? app.user.source.from : 'N/A'
      json.common_app do 
        json.progress app.user.common_app.progress
        json.nationality app.user.common_app.nationality ? app.user.common_app.country_name : 'N/A'
        json.current_city app.user.common_app.current_city ? app.user.common_app.current_city : 'N/A'
        json.cities app.user.common_app.cities.try{ |cit| cit.any? ? '&rarr; ' + cit.map(&:name).join(', ') : 'No cities' }
        json.industries app.user.common_app.industries.try{ |ind| ind.any? ? ind.map(&:name).join(', ') : nil }
        json.grad_year app.user.common_app.grad_year ? app.user.common_app.grad_year : 'N/A'
        json.has_video app.user.common_app.has_video ? 'Yes' : 'N/A'
      end
    end
    json.questions do 
      json.array! app.questions do |question|
        json.id question.id
        json.question_title question.content
        json.video_uuid question.answer.try(:video_uuid)
        json.answer_content question.answer.try(:content)
      end
    end
  end
end