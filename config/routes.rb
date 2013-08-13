Spree::Core::Engine.add_routes do
  get "/oEmbed" => "products#oEmbed"
  namespace :admin do
    resource :social_settings, only: [:edit, :update]
  end
end
