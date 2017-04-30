Rails.application.routes.draw do
  get '/events' => 'litter_box_entries#index'
  get '/pause' => 'litter_box_entries#pause'
  get '/litter-report' => 'litter_box_entries#litter_report'
  post '/log-event' => 'litter_box_entries#log_event'
end
