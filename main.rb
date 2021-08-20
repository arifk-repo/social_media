require 'sinatra'
require 'json'
require './controllers/user_controller'
require './controllers/post_controller'

before do
  content_type :json
end

get '/api/user/' do
  controller = UserController.new
  result = controller.get_all_users
  result.to_json
end

get '/api/user/:id' do
  controller = UserController.new
  result = controller.get_user_by_id(params['id'])
  result.to_json
end

get '/api/user/post/:id' do
  controller = UserController.new
  result = controller.get_user_post(params['id'])
  result.to_json
end

post '/api/user/' do
  puts params['username']
  controller = UserController.new
  result = controller.register_user(params)
  result.to_json
end

put '/api/user/' do
  controller = UserController.new
  result = controller.update_user(params)
  result.to_json
end

delete '/api/user/:id' do
  controller = UserController.new
  result = controller.delete_user(params['id'])
end

get '/api/post/' do
  controller = PostController.new
  result = controller.get_all_post
  result.to_json
end

get '/api/post/:user_id' do
  controller = PostController.new
  result = controller.get_post_by_user(params['user_id'])
  result.to_json
end

put '/api/post/:id' do

end

delete '/api/post/:id' do

end

post '/api/post/' do
  controller = PostController.new
  result = controller.create_post(params)
end