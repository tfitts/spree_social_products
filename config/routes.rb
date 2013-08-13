Spree::Core::Engine.routes.append do
  get "/oEmbed" => "products#oEmbed"
  namespace :admin do
    resource :social, :only => [:edit, :update], :controller => "social"
  end
end
