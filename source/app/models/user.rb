require 'bcrypt'

class User < ActiveRecord::Base

	include BCrypt
	
	has_secure_password
  # Remember to create a migration!
end