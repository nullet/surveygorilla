get '/' do
  logged_in?
  # Look in app/views/index.erb
  erb :index
end

def logged_in?
	redirect to "/sessions/new" unless !session[:user_id].nil?
end
