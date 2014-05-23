get '/users/new' do
  erb :"/users/new"
end

post '/users/new' do
  @user = User.new(name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.save
  	session[:user_id] = @user.id
    redirect to "/"
  else
    erb :"/users/new"
  end
end