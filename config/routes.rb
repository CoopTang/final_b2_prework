Rails.application.routes.draw do
  get '/students/:student_id', to: 'students#show'
  
  get '/courses/:course_id', to: 'courses#show'
end
