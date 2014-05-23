get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do

  erb :login
end

get '/logout' do
  session.clear
  redirect to '/'
end

get '/users/:id' do

end
