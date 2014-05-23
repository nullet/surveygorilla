# RESTful Routes:
# events (resource)
#
# READING
# VERB URL             ACTION  DESC
# GET /events            index   show a list of events
# GET /events/:id        show    show an individual event
#
# CREATING
# GET /events/new        new     show the form to create a new event
# POST /events           create  create a new event
#
# UPDATING
# GET /events/:id/edit   edit    show the form to edit an existing event
# PUT /events/:id        update  change the properties of an existing event
#
# DELETING
# DELETE /events/:id     delete  delete an existing event
#
# /app/views/events/new.erb
#                  edit.erb
#                  index.erb
#                  show.erb

# SESSIONS
# CREATING
# GET /sessions/new        new     show the form to create a new session (login)
# POST /sessions           create  create a new session
#
# DELETING
# DELETE /sessions         delete  delete an existing session (logout)
#
# /app/views/sessions/new.erb

# USERS
# READING
# VERB URL              ACTION  DESC
# GET /users            index   show a list of users
# GET /users/:id        show    show an individual user (profile page?)
#
# CREATING
# GET /users/new        new     show the form to create a new user (signup)
# POST /users           create  create a new user
#
# UPDATING
# GET /users/:id/edit   edit    show the form to edit an existing user
# PUT /users/:id        update  change the properties of an existing user
#
# DELETING
# DELETE /users/:id     delete  delete an existing user
#
# /app/views/users/new.erb
#                  edit.erb
#                  index.erb
#                  show.erb


# List all events (index)
get "/events" do
  @events = event.all
  erb :"events/index"
end

# Show the form to create a new event (new)
get "/events/new" do
  erb :"events/new"
end

# Show a single event (show)
get "/events/:id" do
  @event = event.find(params[:id])
  erb :"events/show"
end

# Create a new event (create)
post "/events" do
  @event = event.new(params)
  if @event.save
    redirect to("/events/#{@event.id}")
  else
    erb :"events/new"
  end
end

# Show the form to edit a event (edit)
get "/events/:id/edit" do
  @event = event.find(params[:id])
  erb :"events/edit"
end

# Update an existing event (update)
put "/events/:id" do
  @event = event.find(params[:id])

  # Dealing with _method:
  #
  # Option #1 Delete _method from params
  # e.g. params = {"_method" => "put", "name" => "Booker T. event", "favorite_food" => "tuna"}
  params.delete("_method")
  if @event.update(params)
    redirect to("/events/#{@event.id}")
  else
    erb :"event/edit"
  end

  # Option #2 Stuff/namespace all the event attributes under a parent key 'event'
  # e.g. params = {"_method" => "put",
  #                "event" => {"name" => "Booker T. event", "favorite_food" => "tuna"}}
  if @event.update(params[:event])
    redirect to("/events/#{@event.id}")
  else
    erb "event/edit"
  end
end

# Delete an existing event (delete)
delete "/events/:id" do
  event.destroy(params[:id])

  redirect to("/events")
end