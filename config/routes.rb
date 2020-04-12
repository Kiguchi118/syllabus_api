Rails.application.routes.draw do

  namespace :api, {format: 'json'} do
    namespace :v1 do
      namespace :lectures do
        get "/" , :action => "index"
      end
    end
  end

end
