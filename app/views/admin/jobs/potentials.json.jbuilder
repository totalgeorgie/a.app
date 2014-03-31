json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.created_at user.created_at
  json.updated_at user.updated_at
  json.common_app do
    json.progress user.common_app.progress
    json.grad_year user.common_app.grad_year ? user.common_app.grad_year : 'N/A' 
    json.nationality user.common_app.nationality ? user.common_app.country_name : 'N/A'
    json.has_video user.common_app.has_video ? 'Yes' : 'N/A'
    json.current_city user.common_app.current_city
    json.cities user.common_app.cities.try{ |cits| cits.any? ? ' &rarr; ' + cits.map(&:name).join(', ') : 'No cities' }
    json.industries user.common_app.industries.try{ |inds| inds.any? ? inds.map(&:name).join(', ') : 'No industries' }
  end
end