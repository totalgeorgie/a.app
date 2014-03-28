json.applications do 
  json.array! @applications do |app|
    json.id app.id
    json.user_id app.user_id
    json.job_id app.job_id
    json.user do 
      json.name app.user.name
      json.source app.user.source ? app.user.source.from : 'N/A'
      json.common_app do 
        json.nationality app.user.common_app.nationality.try { |nat| nat ? nat : 'N/A' }
        json.cities app.user.common_app.cities.try{ |cit| cit.any? ? '&rarr;' + cit.pluck(:name).join(', ') : 'No cities' }
        json.industries app.user.common_app.industries.try{ |ind| ind.any? ? ind.pluck(:name).join(', ') : nil }
        json.grad_year app.user.common_app.grad_year.try{ |yr| yr ? yr : 'N/A'}
        json.has_video app.user.common_app.has_video ? 'Yes' : 'N/A'
      end
    end
    json.questions do 
      json.array! app.questions do |question|
        json.question_title question.content
        json.video_uuid question.answer.try(:video_uuid)
        json.answer_content question.answer.try(:content)
      end
    end
  end
end