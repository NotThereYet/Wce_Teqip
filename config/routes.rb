Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :notices
  resources :studentdetails
  resources :tdocuments
  resources :profdetails
  resources :admindetails
  resources :activities

 
  root to: "users#homepage"
get 'statistics_yearwise', to: "navigation#statistics_yearwise"
get 'cse_graph_yearwise', to: "navigation#cse_graph_yearwise"
get 'mech_graph_yearwise', to: "navigation#mech_graph_yearwise"
get 'it_graph_yearwise', to: "navigation#it_graph_yearwise"
get 'civil_graph_yearwise', to: "navigation#civil_graph_yearwise"
get 'electrical_graph_yearwise', to: "navigation#electrical_graph_yearwise"
get 'electronics_graph_yearwise', to: "navigation#electronics_graph_yearwise"
get 'p_type_graph_yearwise', to: "navigation#p_type_graph_yearwise"

get 'cse_graph', to: "navigation#cse_graph"
get 'mech_graph', to: "navigation#mech_graph"
get 'it_graph', to: "navigation#it_graph"
get 'civil_graph', to: "navigation#civil_graph"
get 'electrical_graph', to: "navigation#electrical_graph"
get 'electronics_graph', to: "navigation#electronics_graph"
get 'p_type_graph', to: "navigation#p_type_graph"
get "homepage", to: "users#homepage"
get "profile_page", to: "users#profile_page"
get "edit_profile_page", to: "users#edit_profile_page"
get "cancel_proposal", to: "proposals#cancel_proposal"
get "summary_page", to: "users#summary_page"
get "alt_new", to: "proposals#alt_new"
get "guidelines",to: "navigation#guidelines"
get "perf_a_report",to: "navigation#perf_a_report"
get "statistics", to: "navigation#statistics"
get "directors_desk",to: "navigation#directors_desk"
get "same_error",to: "proposals#same_error"
get 'download_pdf', to: "proposals#download_pdf"
get "approved_proposals",to: "proposals#approved_proposals"
get "sanctioned_proposals",to: "proposals#sanctioned_proposals"
get "debited_proposals",to: "proposals#debited_proposals"
get "bill_sub_proposals",to: "proposals#bill_sub_proposals"

get 'attending_workshop',to: "proposals#attending_workshop" 
    get 'organizing_event',to: "proposals#organizing_event" 
    get 'organizing_workshop',to: "proposals#organizing_workshop" 
    get 'research_assistantship',to: "proposals#research_assistantship" 
    get 'gate_reg',to: "proposals#gate_reg" 
    get 'organizing_training_program',to: "proposals#organizing_training_program" 
    get 'industrial_visits',to: "proposals#industrial_visits" 
    get 'attending_internship',to: "proposals#attending_internship" 
    get 'inviting_industry',to: "proposals#inviting_industry" 
    get 'campus_training',to: "proposals#campus_training" 
    get 'research_publication',to: "proposals#research_publication" 
    get 'patenting',to: "proposals#patenting" 
    get 'delivering_lectures',to: "proposals#delivering_lectures" 
    get 'project_funding',to: "proposals#project_funding" 
    get 'seed_grant',to: "proposals#seed_grant" 
    get 'qualification_upgradation',to: "proposals#qualification_upgradation" 


resources :proposals
end
