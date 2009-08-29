ActionController::Routing::Routes.draw do |map|
  map.resources :summary_reports, :as => "relatorio_simples", :path_names => {:new => "novo", :show => "visualizar"}
  map.resource :sessions, :as => "sessao", :path_names => {:new => "nova"}
  map.resources :users, :as => "usuarios", :path_names => {:new => "novo", :edit => "ver"} do |usr|
    usr.resources :time_logs, :as => "registro_de_horas", :path_names => {:new => "novo", :edit => "ver"}
  end

  map.resources :projects, :as => "projetos", :path_names => {:new => "novo", :edit => "ver"} do |proj|
    proj.resources :task_types, :as => "tipos_de_tarefas", :path_names => {:new => "novo", :edit => "ver"} 
    proj.resources :project_memberships, :as => "associacao", :path_names => {:new => "nova", :edit => "ver"}
  end
  
  map.root :controller => "projects"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
