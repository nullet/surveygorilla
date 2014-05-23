enable :sessions

get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
  @user = User.find_by_name(params[:name])
  if @user.nil? || @user.authenticate(params[:password]) == false
    @error = "something went wrong - please try again"
    return erb :"/sessions/new"
  end

  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    p session[:user_id]
    erb :index
  end
end 

get '/sessions/destroy' do
  session[:user_id] = nil
  redirect to "/sessions/new"
end