class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    validates :email,              presence: true
    validates :encrypted_password, presence: true
    validates :profile,            presence: true
    validates :user_name,          presence: true
    validates :team,               presence: true
    validates :position,           presence: true

end
