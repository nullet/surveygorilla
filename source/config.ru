# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to 
  set :views, File.join(Sinatra::Application.root, "app", "views")

  # Since we can only use GET & POST in HTML, but
  # would like to use the full range of HTTP verbs,
  # set the :method_override option to true.
  #
  # What this does:
  # Look for params named _method, with possible
  # values of (put|patch|delete)
  # and "re-write" the verb of the request to
  # match _method.
  set :method_override, true
end

run Sinatra::Application


#require 'sinatra'
#require './controllers/posts'

#configure do
  ## Since we can only use GET & POST in HTML, but
  ## would like to use the full range of HTTP verbs,
  ## set the :method_override option to true.
  ##
  ## What this does:
  ## Look for params named _method, with possible
  ## values of (put|patch|delete)
  ## and "re-write" the verb of the request to
  ## match _method.
  #set :method_override, true
#end

#run Sinatra::Application