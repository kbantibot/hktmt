class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts 
  has_many :foods 
  has_many :activities

 after_create :assign_default_role
 
 def assign_default_role
  self.add_role(:user) if self.roles. blank?
 end
end
