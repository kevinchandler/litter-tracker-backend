Rails.application.routes.draw do
  get '/events' => 'litter_box_entries#index'
  get '/pause' => 'litter_box_entries#pause'
  get '/resume' => 'litter_box_entries#resume'
  post '/log-event' => 'litter_box_entries#log_event'
end
