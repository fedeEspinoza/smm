Rails.application.routes.draw do
  resources :users
  resources :roles
  resources :historial_medicions
  resources :zona_usuarios
  resources :usuario_medidors
  resources :usuarios
  resources :medidors
  resources :usuarios
  devise_for :users, :path => 'user'
  resources :personas
  resources :estados
  resources :tipo_medidors
  resources :novedads
  resources :prioridads
  resources :tipo_documentos
  resources :categoria
  resources :zonas
  resources :grupos
  get 'index/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  get 'index' => 'index#index'
  get 'personas/find_persona/:tipo_documento_id/:nro_documento' => 'personas#find_persona'

  post 'restful/log_in' => 'restful#log_in', as: :log_in
  post 'restful/log_up' => 'restful#log_up', as: :log_up
  post 'restful/log_out' => 'restful#log_out', as: :log_out
  get 'restful/descargar_ruta' => 'restful#descargar_ruta', as: :descargar_ruta
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
