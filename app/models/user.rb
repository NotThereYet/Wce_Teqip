class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
attr_accessor :login
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login}]).first
  else
    if conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end
validate :validate_username

def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end
validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => true
  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :authentication_keys => [:login]
end
