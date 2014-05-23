get '/survey/new' do
  if current_user
    erb ":survey/new"
  else
    redirect to "/login"
  end
end

get '/surveys/:id/edit' do
	erb :'/surveys/edit'
end
