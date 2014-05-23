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

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	erb :"/surveys/take"
end

get '/surveys/:id/results' do
	@survey = Survey.find(params[:id])
	erb :"/surveys/results"
end


