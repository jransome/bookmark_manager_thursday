require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, format: :email_address, unique: true, required: true
  property :password_digest, Text

  attr_accessor :password_confirmation
  attr_reader :password

  validates_uniqueness_of :email, :message => "This email address is already registered!"
  validates_confirmation_of :password, :message => "Password and password confirmation fields don't match!"
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
