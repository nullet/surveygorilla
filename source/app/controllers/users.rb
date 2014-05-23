get '/login' do

  erb :login
end

get '/logout' do
  session.clear
  redirect to '/'
end

get '/users/:id' do

  erb :profile
end

#POSTS ---------------------------------------

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/users/:id'
  else
    @errors = ["Username or password was incorrect."]
  end

  erb :login
end

post '/create' do
  if params[:password] == params[:password_confirmation]
    @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users/:id'
    else
      @errors = ["Please make sure you've filled the fields out correctly."]
      erb :login
    end
  else
    @errors = ["Your passwords didn't match."]
    erb :login
  end
end
