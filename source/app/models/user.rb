require 'bcrypt'

class User < ActiveRecord::Base
  has_many :surveys, foreign_key: :author_id
	has_many :completions

  include BCrypt

	def password
      @password ||= Password.new(password_hash)
    end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate
    puts "Write this"
  end
end
