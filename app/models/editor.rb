# Used for authentication.
class Editor < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email
  validates_format_of :email, with: /^[a-zA-Z0-9_\.]+((\+)*[a-zA-Z0-9_\.]+)*@([a-zA-Z0-9_\-]+.)+[a-zA-Z0-9_\-]+$/
end
