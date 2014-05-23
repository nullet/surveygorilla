get '/surveys/new' do
  if current_user
    erb ":survey/new"
  else
    redirect to "/login"
  end
end

get '/surveys/:id/edit' do
	@survey = Survey.find(params[:id])
	erb :'/surveys/edit'
end
