class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  #   :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
end

