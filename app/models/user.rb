class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  alias_method :authenticate, :valid_password?

  # Returns the user stored in the payload's subject
  def self.from_token_payload payload
    self.find payload["sub"]
  end

  def password_digest
    self.encrypted_password
  end
end
