Rails.application.routes.draw do
 
  get 'place/index'
                                            
  get 'post/index/:post_id/place/index' => 'place#index'
 

  get 'post/calu_result/:post_id/place/gogo' =>'place#gogo'
  get 'post/index/:post_id/place/create' =>'place#create'

  devise_for :users
  root 'post#index'
  
  get 'post/index'
  get 'post/new'
  get 'post/time/:post_id' => 'post#time'
  get 'post/lshow/:post_id' => 'post#lshow'
  get 'post/calu/:post_id' => 'post#calu'
  get 'post/calu_result/:post_id' => 'post#calu_result'
  get 'post/calu_angry' => 'post#calu_angry'
  get 'post/calu_angry2' => 'post#calu_angry2'

  post 'post/create'
  get 'post/edit/:post_id' => 'post#edit'
  get 'post/tedit'
  post 'post/update/:post_id' => 'post#update'

  post 'post/destroy/:post_id' => 'post#destroy'

  get '/post/time/:post_id/ttmaking/create' => 'ttmaking#create'
  get '/post/time/:post_id/ttmaking/destroy/:ttmaking_id' => 'ttmaking#destroy'  


  get '/post/etc'
  get '/post/etc_cal'
  get '/post/amidakuji'
  get '/post/team'

  get 'cal/food/:post_id' => 'cal#food'
  
  get 'cal/food_result/:post_id' => 'cal#food_result'
  
  get 'cal/drink/:post_id' => 'cal#drink'

  get 'note/index'
  get 'note/food'
  get 'note/activity'
  get 'note/ttmaking'
  
  get 'food/new' => 'food#new'
  post 'food/create'
  get 'food/show/:post_id' => 'food#show'
  get 'food/edit/:post_id' => 'food#edit'
  post 'food/update/:post_id' => 'food#update'
  post 'food/destroy/:post_id' => 'food#destroy'
  
  post 'activity/create'
  get 'activity/new'
  get 'activity/show/:post_id' => 'activity#show'
  get 'activity/edit/:post_id' => 'activity#edit'
  post 'activity/update/:post_id' => 'activity#update'
  post 'activity/destroy/:post_id' => 'activity#destroy'
  
  get '/post/calu/:post_id/calulator/index' => 'calculator#index'
  
  get '/food/show/:food_id/comments/create' => 'comments#create'
  get '/food/show/:food_id/comments/destroy/:comment_id' => 'comments#destroy'

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
