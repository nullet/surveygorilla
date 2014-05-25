require 'byebug'

get '/surveys/new' do
  if current_user
    if request.xhr?
      erb :"partials/_new_question", layout: false
    else
      erb :"surveys/new"
    end
  else
    redirect to "/login"
  end
end

post '/surveys/new' do
  puts "#{params[:survey][:questions]}"
  new_survey = Survey.create(title: params[:survey][:title], author_id: current_user.id)
  puts "#{new_survey.inspect}"
  params[:survey][:questions].each do |question|
    new_question = Question.create(text: question["text"])
    new_survey.questions << new_question
    question["choices"].each do |choice|
      new_choice = Choice.create(text: choice)
      new_question.choices << new_choice
    end
  end
  redirect to "/profile"
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
end

get '/surveys/:id/results.tsv' do
  @survey = Survey.find(params[:id])
  write_tsv(@survey)
  send_file 'public/data/results.tsv' 
end

post '/surveys/:id/complete' do
  completion = Completion.create(user_id: current_user.id, survey_id: params[:id])
  puts "PARAMS: #{params[:choices]}"
  params[:choices].each do |choice_id|
    answer = Answer.create(choice_id: choice_id, completion_id: completion.id)
    puts "#{answer.inspect}"
  end
  redirect "/surveys/#{params[:id]}/results"
end


