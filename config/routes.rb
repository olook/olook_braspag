OlookBraspag::Application.routes.draw do

   get '/braspag', :to => 'callbacks#new'
   post '/retorno_braspag', :to => 'callbacks#create', :as => :retorno_braspag

end
