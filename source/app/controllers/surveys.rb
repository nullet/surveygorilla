get '/survey/new' do
  @user = session[:user_id]
  erb ":survey/new"
end
