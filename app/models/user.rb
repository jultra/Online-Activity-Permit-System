class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def self.authenticate(password)
    if user.find_by_password(password)#match_password(password)
      return true
    else
      return false
    end
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  easy_roles :roles
  
end
