get '/survey/new' do
  if current_user
    erb ":survey/new"
  else
    redirect to "/login"
  end
end
