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
	@questions = @survey.questions
	erb :"/surveys/take"
end

get '/surveys/:id/results' do
	@survey = Survey.find(params[:id])
  erb :'surveys/results'
 #  @total = @survey.get_number_of_answers
	# erb :"/surveys/results"
end

get '/surveys/:id/results.tsv' do
  @survey = Survey.find(params[:id])
  write_tsv(@survey)
  send_file 'public/data/results.tsv' 
end

post '/surveys/:id/complete' do
  completion = Completion.create(user_id: current_user.id, survey_id: params[:id])
  puts "#{completion.inspect}"
  params[:choices].each do |choice_id|
    answer = Answer.create(choice_id: choice_id, completion_id: completion.id)
    puts "#{answer.inspect}"
  end
  redirect "/surveys/#{params[:id]}/results"
end


