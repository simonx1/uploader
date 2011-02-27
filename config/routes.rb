Uploader::Application.routes.draw do
  resources :uploads
  root :to => "home#index"

  scope "/remote" do
    match "/show_uploaded" => "uploads#show_uploaded"
    match "/desc_update" => "uploads#desc_update"
  end
end
